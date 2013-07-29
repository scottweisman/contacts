class AddGroupIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :group_id, :integer
  end
end
