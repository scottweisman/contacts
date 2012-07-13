class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :admin, :email, :full_name, :group_id, :invitation_id, :password, :plan_id, :stripe_customer_token

  belongs_to :group
  
  validates_presence_of :full_name, :email, :password
  validates_uniqueness_of :email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  
  
  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end
end
