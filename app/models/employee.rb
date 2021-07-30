class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: :all_blank
  validates :name, uniqueness: true
  validate :employee_details

  private
    def employee_details
      if name == ""
        errors.add(:name,"field is empty")
      end
    end
end

