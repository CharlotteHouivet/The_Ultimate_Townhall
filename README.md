# The Ultimate Townhall - The Hacking Project
### Project Week 3, Day 4


Jacques Bauheur has 24 hours to introduce himself and The Hacking Project to every single town hall of the 3 following french departments : Var, Morbihan and Vaucluse.
To succeed in his mission, Jacques was helped by @Joelthp, @Emilie5520, @Elmousski @MattMonta and @CharlotteHouivet.


![alt text](http://image.noelshack.com/fichiers/2018/42/4/1539879144-capture-d-ecran-2018-10-18-a-16-47-15.png)


## Assignment

This project summarizes 4 of the main courses we followed since we've joined The Hacking Project : 
1. Collecting datas by scrapping websites;
2. Save these datas as a JSON file and as a spreadsheet;
3. Send emails with Ruby;
4. Create a Twitter bot. 

## Project tree 

```sh
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── app.rb
├── db
│   ├── townhalls.json
│   └── townhalls.csv
└── lib
   └── app
   │   ├── townhalls_follower.rb
   │   ├── townhalls_mailer.rb
   │   └── townhalls_scrapper.rb
   └── views
       ├── done.rb
       └── index.rb
```

**Gemfile** :  gives the list of all gems included in the project;
**README.md** : contains information about the project;
**app.rb** : launches the program;
**townhalls.csv** : stocks emails scrapped from townhalls as a csv file;
**townhalls.json** : stocks emails scrapped from townhalls as a json file;
**townhalls_follower.rb** : follows every townhall on Twitter;
**townhalls_mailer.rb** : mass mailing, sends a mail to every townhall to tell them about The Hacking Project;
**townhalls_scrapper.rb** : enables the scrapping of townhalls emails; 

## How to execute the program ? 

1. Clone this repository

2. Replace your Gmail username and password in the file
```sh
.env
```
2. Install all the gems
```sh
bundle install
```
3. Run the script
```sh
ruby app.rb
```

## Gems used

- `nokogiri` 
- `open-uri`
- `json`
- `dotenv`
- `gmail`
- `google-drive`
- `twitter`

- `spreadsheet url`: https://docs.google.com/spreadsheets/d/1uv6NI9xfGFVJNJaee9gjyhodusNtx7YQfWA9uQG1H20/edit#gid=0


## Mission complete for Jacques Bauheur !

![alt text](http://image.noelshack.com/fichiers/2018/42/4/1539885175-capture-d-ecran-2018-10-18-a-19-52-27.png)

Jacques Bauheur sent __582 emails__ introducing himself and The Hacking Project !
He also followed twitter handles from his twitter account __@JackBauHeure__. 



