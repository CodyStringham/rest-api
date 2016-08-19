# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.name { "#{FFaker::Name.first_name}" }
    u.age { rand(18..45) }
    u.city { "#{FFaker::Address.city}" }
    u.state { "#{FFaker::AddressUS.state_abbr}" }
  end
end
