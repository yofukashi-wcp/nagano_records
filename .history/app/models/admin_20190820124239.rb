class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def remember_me
    true
  end

  has_many :consts

  # validates :email, presence: true
  # validates :password, presence: true, length: { minimum: 6 }
end
