FactoryBot.define do
  factory :item do
    name { '商品' }
    description { '商品です' }
    price { 5000 }
    category_id { 1 }
    condition_id { 1 }
    select_delivery_fee_id { 1 }
    prefecture_id { 1 }
    term_id { 1 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
