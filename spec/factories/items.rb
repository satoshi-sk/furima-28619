FactoryBot.define do
  factory :item do
    product_name            { 'abcde' }
    text                    { 'abcdefg' }
    category_id             { '2' }
    product_condition_id    { '2' }
    shipping_price_id       { '2' }
    prefecture_id           { '2' }
    shipping_date_id        { '2' }
    price                   { '1000' }
    image {Faker::Lorem.sentence}
    association :user
  end
end
