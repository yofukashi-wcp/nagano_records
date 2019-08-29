class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :cart_item

  validates :quantity, presence: true
end
