class Recipe < ApplicationRecord
  validates :drinks_id, presence: true
  validates :name, presence: true
  
end
