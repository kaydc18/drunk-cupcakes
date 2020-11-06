class Recipe < ApplicationRecord
  validates :drink_id, presence: true
  validates :drink_name, presence: true
  
end
