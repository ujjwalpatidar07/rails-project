class Student < ApplicationRecord
  has_and_belongs_to_many :teachers
  validates :name, presence: true, uniqueness: true
  validates :age, presence: true
end
