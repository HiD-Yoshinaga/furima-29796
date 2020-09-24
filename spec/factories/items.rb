FactoryBot.define do
  factory :item do
    item_info {Faker::Lorem.sentence}
    association :user
    association :order

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
