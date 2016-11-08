# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "admin",
  email: "admin@example.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true
)

11.times do |n|
  name = Faker::Name.name
  descriptions  = "abc-#{n+1}-cba"
  number = Faker::Number.digit
  Category.create!(name: name,
    description: descriptions)
end

12.times do |n|
  name = Faker::Name.name
  category = Faker::Number.between 1, 10
  price = Faker::Number.decimal(3, 3)
  sale_off = Faker::Number.between(0, 50)
  description = Faker::Lorem.paragraphs.join(' ')
  Product.create!(name: name,
    description: description,
    price: price,
    sale_off: sale_off,
    category_id: category
  )
end
