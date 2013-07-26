class CreateMailchimps < ActiveRecord::Migration
  def change
    create_table :mailchimps do |t|
      t.string :list_name
      t.string :list_id
      t.integer :group_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
