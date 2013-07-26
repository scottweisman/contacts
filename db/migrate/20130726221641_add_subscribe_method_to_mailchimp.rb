class AddSubscribeMethodToMailchimp < ActiveRecord::Migration
  def change
    add_column :mailchimps, :subscribe_method, :string
  end
end
