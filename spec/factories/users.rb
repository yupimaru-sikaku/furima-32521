FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'yamada11' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '陸太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'リクタロウ' }
    birthday { '1942-07-09' }
  end
end
