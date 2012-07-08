class AddGroupIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group_id, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
