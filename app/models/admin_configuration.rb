class AdminConfiguration < ApplicationRecord
  validates :name, presence: true
  validates :table_quantity, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true
end
