class Descriptor < ActiveRecord::Base
  attr_accessible :contact_id, :tag_id

  belongs_to :tag
  belongs_to :contact

end
