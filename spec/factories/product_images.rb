FactoryBot.define do
  factory :product_image do
    association :product, strategy: :create
    image do
      fixture_path = Rails.root.join('spec/fixtures/product_image.jpeg')
      Rack::Test::UploadedFile.new(fixture_path, 'image/jpg')
    end
  end
end
