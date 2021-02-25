FactoryBot.define do
  factory :product do
    association :category, strategy: :create

    price { Faker::Number.number(digits: 4) }
    stock { Faker::Number.number(digits: 2) }
    dimensions { Faker::Number.number(digits: 3) }
    weight { Faker::Number.number(digits: 2) }
    delivery_type { rand(0..2) }
    name { Faker::Food.fruits.downcase }
    description { Faker::Food.description }
    delivery_period { Faker::Number.number(digits: 2) }

    trait(:with_image) do
      after(:create) do |product|
        create(:product_image, product: product)
      end
    end
  end
end
