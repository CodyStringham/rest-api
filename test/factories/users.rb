# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.name { "#{Faker::Name.first_name}" }
    u.age { rand(18..45) }
    u.city { "#{Faker::Address.city}" }
    u.state { "#{Faker::AddressUS.state_abbr}" }
  end
end
