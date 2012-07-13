class Invitation < ActiveRecord::Base
  attr_accessible :recipient_email, :sender_id, :token
  
  belongs_to :sender, class_name: 'User'
  has_one :recipient, class_name: 'User'
  
  before_create :generate_token

  private
  
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
