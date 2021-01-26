FactoryBot.define do
  factory :order do
    count { 1 }
    status { 1 }
    product { nil }
    user { nil }
  end
end
