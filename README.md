LIVE WEBSITE ON rocketelevate.com

# README

* Ruby version
2.7.6
* Rails version
5.2.7.1
* System dependencies
make sure rbenv, homebrew and zsh are installed properly, and the .zshrc file has this: ```if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi```


The system dependencies can be installed by following this guide for the correct version of Ruby and Rails https://gorails.com/setup/osx/12-montereyhttps://gorails.com/setup/osx/12-monterey for macos 
and for windows: https://gorails.com/setup/ubuntu/22.04

* Configuration
Run 'Bundle Install' in your terminal to install the required gems for this project.

* Database creation
Navigate to the Rocket_Elevator_Information_System in the terminal, and to create the database do commands ```rake db:create```
```rake db:migrate``` and then ```rake db:seed``` 
The command 
```rake db:setup``` 
MAY work as a replacement for the 3 previous commands, but some errors may be caused.
The amount of values seeded can be found by going into db/seeds.rb file and locating the "requiredAdresses" list, and by uncommenting or commenting addresses.

*Postgres Set up
Navigate to the Rocket_Elevator_Information_System in the terminal, and to create the database do commands 
```rake pg:db:create```
```rake pg:db:migrate```
Then run ```rake warehouse:seed_wh```

*Twilio Set Up
First, to set up twilio you will need to go into your 'Gemfile' and add the 'twilio-ruby' gem
then navigate to your terminal and run 'bundle install'
Next, you will add your twilio provided api key and sid to your secured API key file
then implement the required information provided by twilio into your 'elevator.rb' along with the necessary code.
Finally, to test your twilio set up, change the status of an Elevator to 'Intervention' and a sms should be sent, and the designated phone number should receive the text.

* How to run the test suite
in the Rocket_Elevator_Information_System directory, do command ```rails s``` to begin running the testserver, in the in the browser go to localhost:(whatever ip you designated) {default is 3000}

*SQL Queries
To run the run the queries, navigate to the postgresql terminal by running the command ```psql postgres``` in the terminal.
There are 3 queries that can be ran in the root of the project, which are named question1.sql, question2.sql and question3.sql.
to run the query, simply input the file name.

=====================================
---------------API-------------------
======================================
We use figaro gem for setting environment variables.
The gem reads a config/application.yml file and sets environment variables before anything else is configured in the Rails application.
You can add environment variables as key/value pairs 


* FRESHDESK :
When a customer sends quote request or contact request, new ticket is created on FreshDesk API, domain name codeboxx777.freshdesk.com 
The ticket contanins client's contact information and information that the client fills up in quote request or contact form, which customer support of Rocket Elevators can work with, in order to complete client's request.
gems used: 'rest-client', 'json'

* AMAZON POLLY
 When the admin successfully logged in, and go to Admin page. the Amazon Polly function will be triggered and API being called, which  receiving a text and sends the audio file back with all information that admin can play via simple web browser audio player.
 
 * REST API LINKS
  https://rocketelevatorsfoundationapi.herokuapp.com/
  https://github.com/colebrazeal/Rocket_Elevators_Foundation_API.git
