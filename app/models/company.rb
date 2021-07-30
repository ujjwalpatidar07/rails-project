class Company < ApplicationRecord
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true, uniqueness: true
end
