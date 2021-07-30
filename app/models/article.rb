class Article < ApplicationRecord
	has_many :comments, inverse_of: :article, dependent: :destroy
  
  accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
