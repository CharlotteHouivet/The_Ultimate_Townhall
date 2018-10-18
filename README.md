# The Ultimate Townhall - The Hacking Project
### Project Week 3, Day 4


Jacques Bauheur has 24 hours to introduce himself and The Hacking Project to every single town hall of the 3 following french departments : Var, Morbihan and Vaucluse.
To succeed in his mission, Jacques was helped by @Joelthp, @Emilie5520, @Elmousski and @MattMonta.


![alt text](http://image.noelshack.com/fichiers/2018/42/4/1539879144-capture-d-ecran-2018-10-18-a-16-47-15.png)


## Assignment

This project summarizes 4 of the main courses we followed since we've joined The Hacking Project : 
1. Collecting datas by scrapping websites;
2. Save these datas as a JSON file;
3. Send emails with Ruby;
4. Create a Twitter bot. 

## Project tree 

```sh
.
├── Gemfile
├── README.md
├── app.rb
├── db
│   └── townhalls.json
└── lib
│   └── app
│       ├── townhalls_adder_to_db.rb
│       ├── townhalls_follower.rb
│       ├── townhalls_mailer.rb
│       └── townhalls_scrapper.rb
└── view
    ├── index.rb
    └── done.rb
```
**Gemfile** :  gives the list of all gems included in the project;
**README.md** : contains information about the project;
**app.rb** : 
**townhalls.json** : stocks emails scrapped from townhalls;
**townhalls_adder_to_db.rb** :
**townhalls_follower.rb** : follows every townhall on Twitter;
**townhalls_mailer.rb** : mass mailing, sends a mail to every townhall to tell them about The Hacking Project;
**townhalls_scrapper.rb** : enables the scrapping of townhalls emails; 
**index.rb** :
**done.rb** :

## How to execute the program ? 

Install all the gems
```sh
bundle install
```
Run the script
```sh
ruby app.rb
```


...
une partie qui dit comment se servir du programme, et quelles sont les gems utilisées
...

...
une partie qui explique ce qui a été fait : l'email envoyé, le nombre de mairies touchées, le handle Twitter qui a été utilisé
...


