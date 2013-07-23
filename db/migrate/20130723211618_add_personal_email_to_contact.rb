class AddPersonalEmailToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :personal_email, :string
    add_column :contacts, :title, :string
    rename_column :contacts, :facebook, :linkedin
  end
end
