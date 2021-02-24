class Product < ApplicationRecord
  belongs_to :category
  has_many :product_image

  enum delivery_type: %i[come deliver spot]
end
