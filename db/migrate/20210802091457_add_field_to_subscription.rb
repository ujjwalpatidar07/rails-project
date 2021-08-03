class AddFieldToSubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :razorpay_signature, :string
  end
end
