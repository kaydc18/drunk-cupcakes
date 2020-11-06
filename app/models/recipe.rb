class Recipe < ApplicationRecord
  validates :drink_id, presence: true
  validates :drink_name, presence: true
  
  has_many :measurements
  has_many :ingredients, through: :measurements
end
