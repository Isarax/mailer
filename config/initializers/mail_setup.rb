ActionMailer::Base.smtp_settings = {
  :address              => '127.0.0.1',
  :port                 =>  1025,
  :domain               => 'gmail.com',
  :user_name            => ENV['email'],
  :password             => ENV['email_password'],
  :authentication       => 'plain',
  :enable_starttls_auto => true
}