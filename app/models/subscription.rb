class Subscription < ActiveRecord::Base
  attr_accessible :plan_id, :stripe_customer_token, :stripe_card_token, :email
  belongs_to :plan
  validates_presence_of :plan_id
  validates_presence_of :email
  
  attr_accessor :stripe_card_token
  
  after_create :update_user_attributes
  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(email: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card. Please try again."
    false  
  end
  
  private
  
  def update_user_attributes
    user = User.find_by_email(self.email)
    user.update_attribute(:plan_id, self.plan_id)
    user.update_attribute(:stripe_customer_token, self.stripe_card_token)
    user.save
  end
  
end
