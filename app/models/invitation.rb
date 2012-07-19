class Invitation < ActiveRecord::Base
  attr_accessible :recipient_email, :recipient_full_name, :sender_id, :token
  
  belongs_to :sender, class_name: 'User'
  has_one :recipient, class_name: 'User'
  
  before_create :generate_token
  
  def recipient_full_name
    [recipient_first_name, recipient_last_name].join(' ')
  end

  def recipient_full_name=(name)
    split = name.split(' ', 2)
    self.recipient_first_name = split.first
    self.recipient_last_name = split.last
  end

  private
  
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

end
