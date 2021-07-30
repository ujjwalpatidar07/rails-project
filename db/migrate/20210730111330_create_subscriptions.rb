class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :subscription_plan, index: true
      t.belongs_to :user, index: true
      t.string :razorpay_payment_id
      t.timestamps
    end
  end
end
