class Operation < ApplicationRecord
  belongs_to :maintenance, inverse_of: :operations
end
