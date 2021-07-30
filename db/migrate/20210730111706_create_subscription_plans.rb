class CreateSubscriptionPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_plans do |t|
      t.string :plan_name
      t.integer :plan_value
      t.string :plan_type
      t.string :razorpay_plan_id

      t.timestamps
    end
  end
end
