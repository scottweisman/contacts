class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :group_id
  
  belongs_to :group
  
  after_invitation_accepted :set_group_id
  
  def set_group_id
    invited_by_group = self.invited_by_id.group
    self.update_attributes(:group_id => invited_by_group.id)
  end
  
end
