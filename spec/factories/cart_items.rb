# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cart_item do
    product_id 1
    size_id 1
    finish_id 1
    quantity_id 1
    price_id 1
  end
end
