class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  t.string :first_name, null: false
  t.string :last_name, null: false
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
