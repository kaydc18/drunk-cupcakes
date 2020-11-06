class Measurement < ApplicationRecord
  validates :measurement, presence: true
  
  belongs_to :recipe
  belongs_to :ingredient
end
