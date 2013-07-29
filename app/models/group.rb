class Group < ActiveRecord::Base
  attr_accessible :name, :mailchimp

  has_many :users
  has_many :contacts
  has_many :mailchimps
  has_many :tags

  before_create :contacts_count

  def contacts_count
    if self.contacts.length == 20
      redirect_to edit_user_path
    end
  end



end
