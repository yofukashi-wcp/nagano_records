class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def remember_me
    true
  end
  # ユーザー検索メソッド
  def User.search(search)
    if search.present?
      User.where("first_name like ? OR last_name like ? OR (last_name || first_name) like ? OR (last_name || first_name) like?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    else 
      User.all
    end
  end

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_ruby, presence: true
  validates :last_name_ruby, presence: true
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 11 }
  validates :zip_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  # 新しいパスワードと確認用パスワードの一致を検証
  validates :password, confirmation: true
end
