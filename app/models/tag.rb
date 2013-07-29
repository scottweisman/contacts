class Tag < ActiveRecord::Base
  attr_accessible :name, :user_id, :group_id

  validates_presence_of :name, :user_id, :group_id

  belongs_to :group
  belongs_to :user
  has_many :contacts, :through => :descriptors
  has_many :descriptors, :dependent => :destroy

end
