# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dream do
    date "#{Time.now}"
    category "#{['Fantasy', 'Psychic', 'Nightmare'].sample}"
    description "#{Faker::Lorem.phrase}"
    user nil
  end
end
