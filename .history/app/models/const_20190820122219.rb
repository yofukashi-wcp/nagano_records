class Const < ApplicationRecord
  belongs_to :admin

  validates :name, presence: true
  validates :value, presence: true
end
