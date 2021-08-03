class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if Razorpay::Utility.verify_payment_signature(verify_signature)
      @subscription.save
      byebug
      @subscriptionas = Razorpay::Subscription.create plan_id: @subscription.subscription_plan.razorpay_plan_id, customer_id: current_user.customer_id, start_at: (Time.now + (60 * 60 * 24)).to_i, total_count: 3

      SubscriptionMailer.with(subscription: @subscription).new_subscription_email.deliver_later
      redirect_to subscriptions_path
    else
      redirect_to pay_now_subscriptions_path
    end
  end

  def pay_now
    @subscription = Subscription.new
    @subscription_plan = SubscriptionPlan.find_by_id(params[:subscription_plan][:id])
    @order = Razorpay::Order.create amount: (@subscription_plan.plan_value * 100).to_i, currency: 'INR', receipt: 'TEST'
    if current_user.customer_id.blank?
      @customer = Razorpay::Customer.create name: current_user.name, email: current_user.email, contact: current_user.contact_no,fail_existing: '0'
      current_user.update(customer_id: @customer.id)
    end
  end

  private
    def subscription_params
      params.require(:subscription).permit(:name, :subscription_plan_id, :user_id, :razorpay_payment_id, :razorpay_order_id, :razorpay_signature)
    end

    def verify_signature
      { 
      :razorpay_order_id   => @subscription.razorpay_order_id, 
      :razorpay_payment_id => @subscription.razorpay_payment_id, 
      :razorpay_signature  => @subscription.razorpay_signature 
      }
    end
end
