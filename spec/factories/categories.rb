FactoryBot.define do
  factory :category do
    name { %w[Food Drink Baby Accessories].sample }
  end
end
