FactoryBot.define do
  factory :order do
    association :product, strategy: :build
    association :user, strategy: :build
    count { 1 }
    status { 0 }
  end
end
