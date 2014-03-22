# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :promo_item do
    product_id 1
    description "MyText"
  end

  factory :invalid_promo_item, parent: :promo_item do |f| 
		f.description nil 
	end
end

