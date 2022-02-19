class Category < ApplicationRecord
    validates :title, presence: true, uniqueness: {case_sensitive: false}
    has_many :products
    has_one_attached :image 
    validates :image, attached: true, content_type: %i[png jpg jpeg], size: { less_than: 5.megabytes }
end
