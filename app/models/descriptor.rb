class Descriptor < ActiveRecord::Base
  attr_accessible :contact_id, :tag_id

  belongs_to :tag
  belongs_to :contact

  after_create :subscribe_to_mailchimp_list, :if => :subscribable?
  after_destroy :unsubscribe_from_mailchimp_list, :if => :subscribed?

  #instance methods
  def mailchimp_list
    contact.group.mailchimps.where(:list_name => tag.name).first
  end

  def subscribable?
    (mailchimp_list && mailchimp_list.subscribe_tagged? && contact.mailchimp_email).present?
  end

  def subscribed?
    mailchimp_list.present?
  end

  def subscribe_to_mailchimp_list
    contact.subscribe_to_mailchimp_list(mailchimp_list)
  end

  def unsubscribe_from_mailchimp_list
    contact.unsubscribe_from_mailchimp_list(mailchimp_list)
  end

end
