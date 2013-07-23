class Tag < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates_presence_of :name, :user_id

  belongs_to :user
  has_many :contacts, :through => :descriptors

end
