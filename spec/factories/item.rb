FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Books::Lovecraft.sentence }
    unit_price { Faker::Number.decimal(l_digits: rand(9), r_digits: 2) }
    merchant
  end
end
