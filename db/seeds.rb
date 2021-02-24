# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include FactoryBot::Syntax::Methods

# Create sample product
category = create(:category)
product = create(:product, category: category)

# Create merchant user
merchant = create(:user, email: 'merchant@example.com', password: '!QASZ2wsx')
create(:merchant, user: merchant)

# Create normal user
user = create(:user, email: 'user@example.com', password: '!QASZ2wsx')
# Create normal user basket
basket = create(:basket, user: user, product: product)