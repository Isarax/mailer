class MailerController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def deliver
    image = params[:image] && { 'name' => params[:image].original_filename, 'content' => params[:image].read }
    letter = Letter.new(params[:subject], params[:text], image)
    
    @job_state = JobState.new(completion: 0)
    @job_state.save

    job = Delayed::Job.new
    job.handler = MailingJob.new(letter, @job_state.id)
    job.save

    respond_to do |format|
      format.js 
    end
  end

  def check_delivery
    @completion = JobState.find(params[:job_state_id]).completion

    respond_to do |format|
      format.js
    end
  end
end
