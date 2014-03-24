FactoryGirl.define do
  factory :user do |f|
		f.email "pat@gmail.com"
		f.password "secret"
		after(:create) { |u| u.password_confirmation = u.password }
  end
  factory :invalid_user, parent: :user do |f| 
		f.email nil 
	end
end
