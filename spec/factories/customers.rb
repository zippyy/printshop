# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "MyString"
    company "MyString"
    email "MyString"
    email_confirmation "MyString"
  end
end
