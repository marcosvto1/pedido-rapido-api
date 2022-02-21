class Product < ApplicationRecord
  include Searchable
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  belongs_to :category
  validates :category, presence: true
  validates :price, presence: true
  validates :time_to_prepare, presence: true
  has_one_attached :image
  validates :image, attached: false, content_type: %i[png jpg jpeg], size: { less_than: 5.megabytes }
  has_many :order_items
end
