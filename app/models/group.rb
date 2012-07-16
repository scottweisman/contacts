class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :users
  has_many :contacts
  
  before_create :contacts_count
  
  def contacts_count
    if self.contacts.length == 20
      redirect_to edit_user_path
    end
  end
  
  
  
end
