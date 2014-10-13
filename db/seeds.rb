# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  User.create!(name: "#{Faker::Name.first_name}", age: rand(18..45), city: "#{Faker::Address.city}", state: "#{Faker::AddressUS.state_abbr}")
end

250.times do
  Dream.create!(user_id: rand(1..50), date: Time.now - rand(100).days, category: ["Fantasy", "Nightmare", "Surreal", "Psychic"].sample, description: "#{Faker::Lorem.phrase}")
end
