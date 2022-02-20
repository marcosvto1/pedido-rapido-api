class Order < ApplicationRecord
  belongs_to :employee
  has_many :order_items

  accepts_nested_attributes_for :order_items

  enum status: {
    opened: 1,
    in_progress: 2,
    ready: 3,
    canceled: 4,
    finish: 5,
  }
end
