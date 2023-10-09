class Order < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :post_number, presence: true
  validates :area_id    , presence: true
  validates :city       , presence: true
  validates :addresses  , presence: true
  validates :bilding
  validates :phone      , presence: true

  belongs_to :purchase
end
