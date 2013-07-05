class Letter
  attr_accessor :subject, :text, :image
  
  def initialize(subject, text, image)
    @subject = subject
    @text = text
    @image = image
  end
end