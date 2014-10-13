# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dream do |d|
    d.date { "#{Time.now}" }
    d.category { "#{['Fantasy', 'Psychic', 'Nightmare'].sample}" }
    d.description { "#{Faker::Lorem.phrase}" }
    d.user { nil }
  end
end
