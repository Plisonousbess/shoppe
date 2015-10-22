FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(3) }
    price { Faker::Commerce.price }
    url { Faker::Avatar.image }
  end
end
