class Track < ApplicationRecord
  belongs_to :product

  validates :product_id, presence: true
  validates :disc, presence: true
  validates :number, presence: true
  validates :name, presence: true
  validates :length, presence: true
end
