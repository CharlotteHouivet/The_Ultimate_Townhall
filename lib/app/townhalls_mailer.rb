require 'gmail' 
require 'json'
require 'dotenv'


class Mailer
  
  def lemail(adresse, name)
# On utilise Dotenv pour cacher le User & MDP avec la gem GMAIL / il faut donc creer un .env avec vos codes
Dotenv.load
    username = ENV["USERNAME"]
    password = ENV["PASSWORD"]

    gmail = Gmail.connect(username, password)
# On compose le mail avec le Body 
    email = gmail.compose do
    to "#{adresse}"
    subject "Hello #{name} !"
    body " "
        html_part do
        content_type 'text/html; charset=UTF-8'
        body "Bonjour,
        Je m'appelle Jacques BauHeure, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, 
        sans restriction géographique. La pédagogie de ntore école est celle du peer-learning,
        où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. 
        Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
        Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{name} veut changer le monde avec nous ?
        Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
        end
        end
    email.deliver!
    gmail.logout
end

  def go
# on recupere les informations du JSON
    file = File.read('db/townhalls.json')
    lesmails = JSON.parse(file)
    for i in 0...lesmails.length 
    lemail(lesmails[i]['email'],lesmails[i]['name'])
    end
end

end 
# on lance l'appli
#go = Mailer.new
#go.go