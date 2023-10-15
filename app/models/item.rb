class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :area
  belongs_to :deliverydate

  has_one_attached :image
  validates :title          , presence: true
  validates :detail         , presence: true
  validates :price          , presence: true
  validates :image          , presence: true

  validates :category_id    , numericality: {other_than: 1 , message:"can't be blank"}
  validates :condition_id   , numericality: {other_than: 1 , message:"can't be blank"}
  validates :delivery_id    , numericality: {other_than: 1 , message:"can't be blank"}
  validates :area_id        , numericality: {other_than: 1 , message:"can't be blank"}
  validates :deliverydate_id, numericality: {other_than: 1 , message:"can't be blank"}

  validates_format_of :price, with: /\A[\d]+\z/
  validates :price, numericality:  {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

  # belongs_to :user
  # has_one :purchase
end
