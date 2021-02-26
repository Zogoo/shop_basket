FactoryBot.define do
  factory :category do
    name { %w[cosmetics food drink baby accessories].sample }
  end
end
