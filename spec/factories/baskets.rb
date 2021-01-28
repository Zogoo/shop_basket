FactoryBot.define do
  factory :basket do
    association :product, strategy: :create
    association :user, strategy: :create

    trait :with_order do
      order { create(:order) }
    end
  end
end
