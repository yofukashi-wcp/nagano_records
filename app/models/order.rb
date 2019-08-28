class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  accepts_nested_attributes_for :order_products, allow_destroy: true

  validates :user_id, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :postage, presence: true
  validates :total, presence: true
end
