FactoryBot.define do
  factory :category do
    name { %w[Cosmetics Food Drink Baby Accessories].sample }
  end
end
