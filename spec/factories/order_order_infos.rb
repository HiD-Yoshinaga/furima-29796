FactoryBot.define do
  factory :order_order_info do
    token {"tok_abcdefghijk00000000000000000"}
    postcode { '123-4567' }
    shipping_address_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '12345678910' }
  end
end
