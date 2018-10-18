require 'twitter'
require "dotenv/load"
require_relative 'townhalls_scrapper.rb'


class TwitterFollow
  def initialize(json_file = '')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = ENV["TWITTER_TOKEN_KEY"]
      config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
    end
    @json_file = if json_file == ''
                   "db/townhalls.json"
                 else
                   json_file
                 end
    @city_hash = ScrapperEmails.new.read_json_from_db(@json_file)
  end

  def follow
    @city_hash.each do |city|
      handle = @client.user_search(city["name"])
      begin
        @client.follow!(handle[0])
        city["handle"] = "@" + handle[0].screen_name
      rescue StandardError
        puts "Error: can't find a twitter account for #{city['name']}"
      end
    end
  end

  def update_json
   Dir.mkdir 'db' unless Dir.exist? 'db'
    json_list = @city_hash.to_json
    f = File.open(@json_file, 'w')
    f.write(json_list)
    f.close
  end
end


game = TwitterFollow.new
game.update_json




