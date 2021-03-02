class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  enum status: %i[requested completed canceled blocked]
end
