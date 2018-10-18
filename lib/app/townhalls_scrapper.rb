 
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'
require "google_drive"

class ScrapperEmails


    def write_json_list(filename = 'db/townhalls.json')
    Dir.mkdir 'db' unless Dir.exist? 'db'
    json_list = @list.to_json
    f = File.open(filename, 'w')
    f.write(json_list)
    f.close
end


  def read_json_from_db(filename = 'db/townhalls.json')
    f = File.open(filename, 'r')
    list = ''
    while (line = f.gets)
      list += line
    end
    f.close
    @list = JSON.parse(list)
end

 def get_the_email_of_a_townhal_from_its_webpage(url)
      page = Nokogiri::HTML(open(url))
      page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  end


def get_the_district(url)
    page = Nokogiri::HTML(open(url))
    page.xpath("//body/div/main/section[4]/div/table/tbody/tr[1]/td[2]").text
  end


def get_all_the_urls_of_var
    array = []
    @var_names = []
    @var_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/var.html]
    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      var_name = link.text
      var_email = get_the_email_of_a_townhal_from_its_webpage(url)
      var_district = get_the_district(url)
      var = {:name => var_name, :email => var_email, :district => var_district}
      array << var 
      @var_names << var_name
      @var_emails << var_email
      end
    end
    return array
end

def get_all_the_urls_of_vaucluse
    array = []
    @vaucluse_names = []
    @vaucluse_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/vaucluse.html]
    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      vaucluse_name = link.text
      vaucluse_email = get_the_email_of_a_townhal_from_its_webpage(url)
      vaucluse_district = get_the_district(url)
      vaucluse = {:name => vaucluse_name, :email => vaucluse_email, :district => vaucluse_district}
      array << vaucluse
      @vaucluse_names << vaucluse_name
      @vaucluse_emails << vaucluse_email
      
    end
     
    end
     return array
end



 def get_all_the_urls_of_morbihan
    array = []
    @morbihan_names = []
    @morbihan_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/morbihan.html]
    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      morbihan_name = link.text
      morbihan_email = get_the_email_of_a_townhal_from_its_webpage(url)
      morbihan_district = get_the_district(url)
      morbihan = {:name => morbihan_name, :email => morbihan_email, :district => morbihan_district}
      array << morbihan
      @morbihan_names << morbihan_name
      @morbihan_emails << morbihan_email
      end
    end
    return array
end


  def json_test
  File.open("db/townhalls.json", "w") do |x|
  x.write(json_test1.to_json)
  end
  end

  def json_test1
  get_all = get_all_the_urls_of_var + get_all_the_urls_of_vaucluse + get_all_the_urls_of_morbihan
  return get_all
  end

end

class Spreadsheet
  
  def setup(key)
    session = GoogleDrive::Session.from_config("config.json")
    @ws = session.spreadsheet_by_key(key).worksheets[0]
    emails = File.read("../../db/townhalls.json") 
    @parsed_emails = JSON.parse(emails)
  end
  
  def filler
    @parsed_emails.each_with_index do |hash, i|
      @ws[i+1, 1] = hash["name"]
      @ws[i+1, 2] = hash["email"]
      @ws[i+1, 3] = hash["district"]

    end
    @ws.save
  end
  
  def perform
    setup("1uv6NI9xfGFVJNJaee9gjyhodusNtx7YQfWA9uQG1H20")
    filler
  end
end



#game = ScrapperEmails.new
#game.json_test

#spreed = Spreadsheet.new
#spreed.perform

