FactoryBot.define do
  factory :message do
    text { "MyText" }
    item_id { 2 }
    user_id { 2 }

    association :item
    association :user
  end
end
