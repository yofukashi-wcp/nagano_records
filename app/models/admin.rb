class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def remember_me
    true
  end

  validates :email, presence: true
  # 新しいパスワードと確認用パスワードの一致を検証
  validates :password, confirmation: true
end
