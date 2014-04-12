require 'spec_helper'

describe Customer do

	it "has a valid factory" do
		create(:customer).should be_valid
	end

	describe "#create" do

		it "it is invalid witout an email" do
			build(:customer, email: nil).should_not be_valid
		end

		it "it is invalid without an email confirmation" do
			build(:customer, email_confirmation: nil).should_not be_valid
		end

		it "it is valid without a company" do
			build(:customer, company: nil).should be_valid
		end
	end
end
