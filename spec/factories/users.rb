FactoryBot.define do
  factory :user do
    uid { Faker::Internet.uuid }
    first_name { Faker::Movies::LordOfTheRings.character }
    last_name { Faker::Movies::StarWars.character }
    provider { 'facebook' }
    email { Faker::Internet.email }
    password { Faker::Crypto.md5 }
    confirmed_at { Time.now }
    trait :confirmed do
      before(:create) { |user| user.skip_confirmation! }
      after(:build) { |user| user.skip_confirmation! }
    end
  end
end
