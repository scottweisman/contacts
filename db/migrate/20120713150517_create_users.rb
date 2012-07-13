class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :group_id
      t.integer :invitation_id
      t.boolean :admin
      t.string :stripe_customer_token
      t.integer :plan_id

      t.timestamps
    end
  end
end
