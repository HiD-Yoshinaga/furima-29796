class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :day_to_ship

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
  end

  validates :item_price, presence: true,
                         numericality: {
                           greater_than_or_equal_to: 300,
                           less_than_or_equal_to: 9_999_999,
                           message: "is out of setting range"
                         },
                         format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." }

  with_options presence: true, numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_condition_id
    validates :shipping_fee_id
    validates :ship_from_id
    validates :day_to_ship_id
  end
end
