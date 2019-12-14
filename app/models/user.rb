class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars, inverse_of: :user
  has_many :maintenances, through: :cars, inverse_of: :user
  has_many :operations, through: :maintenances, inverse_of: :user
end
