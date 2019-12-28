class Car < ApplicationRecord
  belongs_to :user, inverse_of: :cars
  has_many :maintenances, inverse_of: :car, dependent: :destroy
  has_many :operations, through: :maintenances, inverse_of: :car
  accepts_nested_attributes_for :maintenances, allow_destroy: true
end
