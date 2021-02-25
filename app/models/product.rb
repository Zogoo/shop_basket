class Product < ApplicationRecord
  belongs_to :category
  has_many :product_image

  enum delivery_type: %i[come deliver spot]

  def self.search_by_keyword(keyword)
    kwd_array = Array.wrap(keyword.split(' ')).join(',')
    where('name LIKE :name or tags && :kwd_arr', name: "%#{keyword}%", kwd_arr: "{#{kwd_array}}")
  end
end
