FactoryBot.define do
  factory :merchant do
    association :user, strategy: :create

    name { Faker::Company.name }
    address { Faker::Address.full_address }
    mobile { Faker::PhoneNumber.cell_phone }
    mobile_confirmed { true }
    phone { Faker::PhoneNumber.phone_number }
    phone_confirmed { true }
  end
end
