# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :price do
    price 1
    product_id 1
    size_id 1
    finish_id 1
    quantity ""
  end
end
