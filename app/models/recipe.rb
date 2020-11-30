class Recipe < ApplicationRecord
  validates :drink_id, presence: true
  validates :drink_name, presence: true
  validates :drink_image, presence: false
  
  has_many :measurements
  has_many :ingredients, through: :measurements
  has_many :recipe_books
  has_many :users, through: :recipe_books
  has_many :reviews
end
