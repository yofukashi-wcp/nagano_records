class Product < ApplicationRecord
  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  has_one :track, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_one :order_product

  validates :name, presence: true
  validates :artist_id, presence: true
  validates :label_id, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  attachment :jacket_image
  validates :summary, length: { maximum: 500 }
end
