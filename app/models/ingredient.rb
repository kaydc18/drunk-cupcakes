class Ingredient < ApplicationRecord
  validates :ingredient_id, presence: true
  validates :ingredient_name, presence: true
  validates :ingredient_alcohol, presence: true

  has_many :measurements
  has_many :recipes, through: :measurements
end
