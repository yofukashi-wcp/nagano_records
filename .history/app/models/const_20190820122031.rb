class Const < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :value, presence: true
end
