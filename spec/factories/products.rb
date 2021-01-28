FactoryBot.define do
  factory :product do
    association :category, strategy: :create

    name { Faker::Food.fruits }
    description { Faker::Food.description }
    delivery_period { Faker::Number.number(digits: 2) }
  end
end
