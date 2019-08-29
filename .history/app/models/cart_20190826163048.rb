class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :cart_items

  validates :quantity, presence: true
end
