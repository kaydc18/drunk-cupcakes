class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, null: false
  validates :last_name, null: false
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
