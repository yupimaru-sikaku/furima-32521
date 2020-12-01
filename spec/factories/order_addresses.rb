FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '111-1111' }
    prefecture_id { '1' }
    city { '横浜市' }
    house_number { '青山' }
    building_name { '森ビル' }
    phone_number { '11111111111' }
  end 
end