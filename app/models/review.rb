class Review < ApplicationRecord
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :username, presence: true
  validates :recipe_name, presence: true
  
  belongs_to :user
  belongs_to :recipe
end
