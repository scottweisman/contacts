class Mailchimp < ActiveRecord::Base
  attr_accessible :group_id, :list_id, :list_name, :tag_id, :subscribe_method
end
