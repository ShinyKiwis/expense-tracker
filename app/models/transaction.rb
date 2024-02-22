class Transaction < ApplicationRecord
  validates :description, :date, :category, :amount, presence: true
end
