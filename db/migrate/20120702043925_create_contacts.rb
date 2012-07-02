class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :website
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
