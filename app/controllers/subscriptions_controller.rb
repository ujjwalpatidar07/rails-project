class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      SubscriptionMailer.with(subscription: @subscription).new_subscription_email.deliver_later
      redirect_to subscriptions_path
    else
      redirect_to subscribe_subscriptions_path
    end
  end

  def pay_now
    @subscription = Subscription.new
    @subscription_plan = SubscriptionPlan.find_by_id(params[:subscription_plan][:id])
    @order = Razorpay::Order.create amount: (@subscription_plan.plan_value * 100).to_i, currency: 'INR', receipt: 'TEST'
  end

  private
    def subscription_params
      params.require(:subscription).permit(:name, :subscription_plan_id, :user_id, :razorpay_payment_id)
    end
end
