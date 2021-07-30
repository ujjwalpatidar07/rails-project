class Subscription < ApplicationRecord
  belongs_to :userr, optional: true
  belongs_to :subscription_plan
end
