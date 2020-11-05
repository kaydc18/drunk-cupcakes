class Recipe < ApplicationRecord
  validates :name, presence: true
  validated :id, presence: true
  
end
