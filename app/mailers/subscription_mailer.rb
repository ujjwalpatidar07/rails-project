class SubscriptionMailer < ApplicationMailer
	def new_subscription_email
	    @subscription = params[:subscription]
	    @url  = 'http://localhost:3000/users/sign_in'
	    mail(to: @subscription.userr.email, subject: "You got a new subscription!")
	end
  
  #default from: 'notifications@example.com'

  # def new_subscription_email
  #   @subscription = params[:subscription]
  #   @url  = 'http://localhost:3000/users/sign_in'
  #   mail(to: @subscription.userr.email, subject: 'Welcome to My Awesome Site')
  # end
end
