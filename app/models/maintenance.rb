class Maintenance < ApplicationRecord
  belongs_to :car, inverse_of: :maintenances
  has_one :user, through: :car, inverse_of: :maintenances
  has_many :operations, inverse_of: :maintenance, dependent: :destroy
  accepts_nested_attributes_for :operations, allow_destroy: true

end
