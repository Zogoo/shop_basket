# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include FactoryBot::Syntax::Methods

# Create sample product
categories = Array.new(100) do
  category = build(:category)
  category.save if category.valid?
  Category.find_by_name(category.name)
end

products = categories.map do |cat|
  create(:product, :with_image, category: cat)
end

# Create merchant user
merchant = build(:user, email: 'merchant@example.com', password: '!QASZ2wsx')
merchant.save if merchant.valid?
create(:merchant, user: merchant) if merchant.valid?

# Create normal user
user = build(:user, email: 'user@example.com', password: '!QASZ2wsx')
user.save if user.valid?

# Create normal user basket
products.sample do |product|
  create(:basket, user: user, product: product) if user.valid?
end