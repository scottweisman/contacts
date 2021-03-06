class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :admin, :email, :full_name, :group_id, :invitation_id, :invitation_token, :password,
                  :plan_id, :stripe_customer_token, :group_name

  belongs_to :group
  has_many :contacts
  has_many :tags

  validates_presence_of :full_name, :email, :password
  validates_uniqueness_of :email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  attr_accessor :group_name

  after_create :set_group_name_if_blank

  #Class Methods
  def self.new_plan_needed
    'new plan needed'
  end

  def self.maximum_free_contacts
    200
  end

  #Instance Methods
  def check_number_of_contacts
    if self.plan_id.nil?
      if self.group.contacts.length == User.maximum_free_contacts
        return User.new_plan_needed
      end
    end
  end

  def mailchimp_lists
    gb = Gibbon::API.new(self.group.mailchimp)
    begin
      lists = gb.lists.list({:start => 0, :limit=> 100})["data"]
    rescue
      []
    end
  end


  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  def set_group_name_if_blank
    if self.group.name.blank?
      self.group.update_attribute(:name, "#{self.full_name}'s Group")
    end
  end

  def user_plan
    if self.plan_id == nil
      "Free"
    else
      "Pro"
    end
  end

end
