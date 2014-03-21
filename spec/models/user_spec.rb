require 'spec_helper'


describe User do
	
	it "has a valid factory" do
		create(:user).should be_valid
	end

	describe "#create" do

		it "it is invalid witout an email" do
			build(:user, email: nil).should_not be_valid
		end

		it "does not allow duplicate emails" do
			user1 = create(:user)
			user2 = build(:user)
			user2.should_not be_valid
		end
	end
end