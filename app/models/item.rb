class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ItemCategory
  belongs_to_active_hash :ItemCondition
  belongs_to_active_hash :ShippingFee
  belongs_to_active_hash :ShipFrom
  belongs_to_active_hash :DayToShip

  belongs_to :user
  # belongs_to :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
  end

  validates :item_price, presence: true,
                         numericality: {
                           greater_than_or_equal_to: 300,
                           less_than_or_equal_to: 9_999_999,
                           message: '金額が¥300~9,999,999の範囲外です'
                         },
                         format: { with: /\A[0-9]+\z/, message: '販売価格は半角数字で入力してください' }

  with_options presence: true, numericality: { other_than: 1 } do
    validates :item_categories_id
    validates :item_condition_id
    validates :shipping_fee_id
    validates :ship_from_id
    validates :day_to_ship_id
  end
end
