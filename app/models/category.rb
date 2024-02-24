class Category < ApplicationRecord
  validates :name, length: { minimum: 1, allow_nil:false }, presence: true, uniqueness: true
end
