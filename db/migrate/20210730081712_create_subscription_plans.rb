class CreateSubscriptionPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_plans do |t|
      t.integer :value
      t.string :type
      t.string :razorpay_plan_id

      t.timestamps
    end
  end
end
