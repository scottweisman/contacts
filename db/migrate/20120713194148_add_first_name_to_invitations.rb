class AddFirstNameToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :recipient_first_name, :string
    add_column :invitations, :recipient_last_name, :string
  end
end
