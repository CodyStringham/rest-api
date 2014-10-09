# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#HTTParty.post('http://rest-api.dev/api/v1/users', body: { user: {name: "#{Faker::Name.first_name}", age: rand(18..65), city: "#{Faker::Address.city}", state: "#{Faker::AddressUS.state_abbr}"} })

HTTParty.post('http://rest-api.dev/api/v1/users', body: { dream: {user_id: rand(1..50), category: ["Fantasy", "Nightmare", "Surreal", "Psychic"].sample, description: "#{Faker::Lorem.phrase}" } })
