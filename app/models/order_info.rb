class OrderInfo < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_address
end
