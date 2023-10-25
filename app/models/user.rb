class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :name_last, presence: true
  validates :name_first, presence: true
  validates :kana_last, presence: true
  validates :kana_first, presence: true
  validates :birthday, presence: true

  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  validates_format_of :name_last, :name_first, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :kana_last, :kana_first, with: /\A[ァ-ヶー]+\z/

  has_many :items
  has_many :purchases
end
