class Address < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
end
