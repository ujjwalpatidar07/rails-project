class SubscriptionPlan < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :userrs, through: :subscriptions
  validates :plan_value, presence: true

  def validate_and_save
    begin
      plan = Razorpay::Plan.create interval: 1, period: self.plan_type.to_s.downcase, item: { name: self.plan_name, description: self.plan_name, currency: 'INR', amount: self.plan_value.to_i * 100 }, notes: { identifier: 'demo subscriptions' }
      self.razorpay_plan_id = plan.id
      self.save
    rescue => e
      byebug
      false
    end
  end
end
