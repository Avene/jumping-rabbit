class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  has_many :cars, inverse_of: :user
  has_many :maintenances, through: :cars, inverse_of: :user
  has_many :operations, through: :maintenances, inverse_of: :user
end
