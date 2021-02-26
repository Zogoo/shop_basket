class Category < ApplicationRecord
  has_many :products

  validates :name, uniqueness: true, presence: true

  def self.search_by_name(name)
    where('name LIKE ?', "%#{name&.downcase}%")
  end
end
