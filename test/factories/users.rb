# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "#{Faker::Name.first_name}"
    age rand(18..45)
    city "#{Faker::Address.city}"
    state "#{Faker::AddressUS.state_abbr}"
  end
end
