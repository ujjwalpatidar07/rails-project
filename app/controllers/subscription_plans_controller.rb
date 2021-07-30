class SubscriptionPlansController < ApplicationController
  before_action :authenticate_user!
  def index
    @subscriptionplans = SubscriptionPlan.all
  end

  def new
    @subscriptionplan = SubscriptionPlan.new
  end

  def show
    @subscriptionplan = SubscriptionPlan.find(params[:id])
  end

  def create
    @subscriptionplan = SubscriptionPlan.new(subscriptionplan_params)
    if @subscriptionplan.validate_and_save
      redirect_to subscription_plans_path
    else
      render :new
    end
  end

  def destroy
    @subscriptionplan = SubscriptionPlan.find(params[:id])
    @subscriptionplan.destroy

    redirect_to subscription_plans_path
  end


  private
    def subscriptionplan_params
      params.require(:subscription_plan).permit(:plan_value, :plan_type, :plan_name)
    end
end
