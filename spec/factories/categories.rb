FactoryBot.define do
  factory :category do
    name { %w[cosmetics food drink baby accessories].sample }
    icon_name { %w[lipstic food baby food-fork-drink necklace].sample }
  end
end
