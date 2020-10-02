class OrderOrderInfo
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_address_id, :city, :house_number, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/}
    validates :token
  end

  validates :shipping_address_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  def save
    order = Order.create(user_id: user_id, item_id: item_id )
    OrderInfo.create(order_id: order.id, postcode: postcode, shipping_address_id: shipping_address_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number )
  end
end