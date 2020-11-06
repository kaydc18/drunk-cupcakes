class Ingredient < ApplicationRecord
  validates :ingredient_id, presence: true
  validates :ingredient_name, presence: true
end
