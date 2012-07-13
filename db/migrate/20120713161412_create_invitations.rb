class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :recipient_email
      t.integer :sender_id
      t.string :token

      t.timestamps
    end
  end
end
