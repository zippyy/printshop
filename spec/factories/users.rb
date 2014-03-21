FactoryGirl.define do
  factory :user do |f|
		f.email "pat@gmail.com"
		f.password "secret"
		after(:create) { |u| u.password_confirmation = u.password }
  end
end
