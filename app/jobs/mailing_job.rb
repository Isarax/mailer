class MailingJob < Struct.new(:letter, :job_state_id)
  def perform
    num_of_mails = 10
    mailer = UserMailer.custom_letter(letter)
    job_state = JobState.find(job_state_id)
    
    num_of_mails.times do |i|
      mailer.deliver
      completion = (((i.to_f + 1) / num_of_mails) * 100).to_i
      job_state.update_attributes(completion: completion)
    end
  end
end