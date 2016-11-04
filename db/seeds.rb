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
