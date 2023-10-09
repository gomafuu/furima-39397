class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :item, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_id, presence: true
  validates :area_id, presence: true
  validates :deliverydate_id, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one :purchase
end
