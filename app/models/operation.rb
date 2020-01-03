class Operation < ApplicationRecord
  belongs_to :maintenance, inverse_of: :operations
  has_one :car, through: :maintenance, inverse_of: :operations
  has_one :user, through: :car, inverse_of: :operations

  scope :by_title_like, lambda { |q|
    where('lower(operations.title) LIKE :q', { q: "#{sanitize_sql_like(q.downcase)}%"})
  }
end
