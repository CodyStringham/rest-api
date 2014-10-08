# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dream do
    date "2014-10-08 11:27:00"
    category "MyString"
    description "MyText"
    user nil
  end
end
