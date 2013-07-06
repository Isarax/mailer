Mailer
======
Deployment instructions

I assume you are using rvm, in case you don't here is a great article http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/.

Clone repository and go to the appliction directory.
Create a gemset: $ rvm gemset create mailer
Set .rvmrc file (based on your verson of ruby): $ rvm use 1.9.3-p392@mailer --rvmrc
Install gems: $ bundle install
Configure /config/database.yml file, I am using PostgreSQL but you can change it to any other relational database.
Create and migrate the database:
$ rake db:create
$ rake db:migrate
Configure /config/initializers/mail_setup.rb file - by default it is configured to sent mails to mailcatcher.
I recommend to start server in the production mode because in development mode it logs a lot of debug information which slows email delivery a lot.
Go into production mode:
$ RAILS_ENV=production
$ export RAILS_ENV
Start delayed job: $ script/delayed_job start
Start mailcatcer: $ mailcatcher
Start server: $ rails s

You can find app on localhost:3000 and mailcatcher on localhost:1080.



