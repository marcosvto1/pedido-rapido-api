class AdminConfiguration < ApplicationRecord
  validates :name, presence: true
  validates :table_quantity, presence: true
end
