class AddMailchimpApiKeyToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :mailchimp, :string
  end
end
