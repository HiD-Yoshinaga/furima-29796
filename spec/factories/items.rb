FactoryBot.define do
  factory :item do
    item_name { 'itemname' }
    item_info { Faker::Lorem.sentence }
    item_price { 1234 }
    item_category_id { 2 }
    item_condition_id { 2 }
    shipping_fee_id { 2 }
    ship_from_id { 2 }
    day_to_ship_id { 2 }
    user_id { 2 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
