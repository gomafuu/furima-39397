class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname   , presence: true
         validates :name_last  , presence: true
         validates :name_first , presence: true
         validates :kana_last  , presence: true
         validates :kana_first   , presence: true
         validates :birthday       , presence: true

         validates_format_of :kana_last, :kana_first, with: /\A[ァ-ヶ]+\z/, message: "can't be blank(katakana)"
         validates_format_of :name_last, :name_first, with: /\A[ぁ-ん]+\z/, message: "can't be blank(hiragana)"

         has_many :items
         has_many :purchases
       
end
