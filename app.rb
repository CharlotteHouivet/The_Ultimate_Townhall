require 'bundler'
Bundler.require

require 'nokogiri'
#require 'open-uri'
require 'json'
require 'dotenv'
require 'gmail'
require 'google_drive'
require 'twitter'

require './lib/app/townhalls_scrapper'
require './lib/app/townhalls_mailer'
require './lib/app/townhalls_follower'
require './lib/views/index'
require './lib/views/done'

class App
  def initialize
  	puts "Bienvenue sur notre application Ultimate Townhall !!!! "
  	puts "      -   Super THP  -  "
  	puts " "
  	puts " "

  end

  def action
  	#   puts "----------- MENU ----------------"
	  # puts "Tape 1 pour scrapper les mairies"
	  # puts "Tape 2 pour leurs envoyer des emails"
	  # puts "Tape 3 pour les follow sur tweeter"
	  # puts "Tape 4 pour sortir de l'app"
	  # puts "---------------------------------"
	  # print "Votre choix : "
		Jindex.new.affichage

	  @reponse = gets.chomp.to_i

      while @reponse != 4  	
	    if @reponse == 1
	      getemails = ScrapperEmails.new.json_test
	      action
	    elsif @reponse == 2
	    	require './lib/app/townhalls_mailer'
	      	@sendmails = Mailer.new.go
	      	action
	    elsif @reponse == 3
	    	puts " "
	    	puts "Pour chaque mairie nous allons suivre tous les comptes existants, soyez patients..."
	    	TwitterFollow.new.follow
	    	action

		action

	    elsif @reponse == 4
	    	Jexit.new.sortie
	    	exit
		end
		end
 	end
end

App.new.action