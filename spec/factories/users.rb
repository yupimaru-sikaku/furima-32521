FactoryBot.define do
  factory :user do
    nickname { 'yamada' }
    email { 'yamada@gmail.com' }
    password { 'yamada11' }
    password_confirmation {password}
    last_name { '山田' }
    first_name { '陸太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'リクタロウ' }
    birthday { '1942-07-09' }
  end
  #   nickname {Faker::Name.name}
  #   email {Faker::Internet.free_email}
  #   password = Faker::Internet.password(min_length: 6)
  #   password {password}
  #   password_confirmation {password}
  #   last_name {Faker::Name.last_name}
  #   first_name {Faker::Name.first_name}
  #   last_name_reading { 'ヤマダ' }
  #   first_name_reading { 'リクタロウ' }
  #   birthday { '1942-07-09' }
  # end
end