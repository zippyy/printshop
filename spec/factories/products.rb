FactoryGirl.define do
  factory :product do
    name "Test Product"
    custom true
  end
  factory :invalid_product, parent: :promo_item do |f| 
		f.name nil 
	end
end


