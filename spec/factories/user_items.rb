FactoryBot.define do
  factory :user_item do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜' }
    block_number { '青山' }
    building_name { '柳' }
    phone_number { 12_345_678_912 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
