FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '123456a' }
    encrypted_password { '123456a' }
    family_name { '山田' }
    first_name { '太郎' }
    family_name_kana { 'ヤマダ'}
    first_name_kana {'タロウ'}
    birthday {'1930-01-01'}
  end
end
