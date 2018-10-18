# frozen_string_literal: true

require_relative 'lib/townhalls_scrapper.rb'
require_relative 'lib/townhalls_mailer.rb'
require_relative 'lib/townhalls_follower.rb'
require_relative 'lib/townhalls_adder_to_db.rb'
require 'pry'

def main
  
  puts "We are going to collect emails from 3 french departements: "
  puts '- Var'
  puts '- Vaucluse'
  puts '- Morbihan'
  #FONCTION COLLECTER LES MAILS
  puts "Then we are sending emails to each townhall in these departements"
  puts "to let them know about 'The Hacking Project'"
  #FONCTION ENVOYER LES MAILS
  puts "Finally we are sending sending them tweets, they must know who we are !"
  #FONCTION SUIVRE TWITTER
end



main
