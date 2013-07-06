Mailer
======

#Deployment instructions

I assume you are using rvm, in case you don't here is a great article http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/.

Clone repository and go to the appliction directory.
Create a gemset:
```rvm gemset create mailer```.
Set .rvmrc file (based on your verson of ruby):
```rvm use 1.9.3-p392@mailer --rvmrc```.
Install gems: ```bundle install```.
Configure ```/config/database.yml``` file, I am using PostgreSQL but you can change it to any other relational database.
Create and migrate the database:
```
rake db:create
rake db:migrate
```
Configure ```/config/initializers/mail_setup.rb``` file - by default it is configured to sent mails to mailcatcher.
I recommend to start server in the production mode because in development mode it logs a lot of debug information which slows email delivery a lot.
Go into production mode:
```
RAILS_ENV=production
export RAILS_ENV
```
Because of production mode we need to precompile assets: ```rake assets:precompile```. Now your application must be ready to go, just start delayed job, mailcatcher and server:
```
script/delayed_job start
mailcatcher
rails s
```

You can find app on localhost:3000 and mailcatcher on localhost:1080.

By default application sends 500 letters but you can change it in ```app/jobs/mailing_job.rb``` by setting ```num_of_mails``` variable to whatever you like, you can also change e-mail options in ```app/mailers/user_mailer.rb```, just don't forget to restart delayed job which is running in background ```script/delayed_job restart```. 

#About
This application was made as a test job for an entry Ruby on Rails developer position.

