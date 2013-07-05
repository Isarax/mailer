class UserMailer < ActionMailer::Base
  default from: "isarax@gmail.com"

  def custom_letter(letter)
    @username = Random.new.seed.to_s
    @text = letter.text

    if letter.image 
      @image_name = letter.image['name']
      attachments.inline[@image_name] = letter.image['content']
    end
    
    mail(to: "#{@username}@gmail.com", subject: letter.subject.to_s)
  end
end
