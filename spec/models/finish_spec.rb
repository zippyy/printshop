require 'spec_helper'

describe Finish do

	it "has a valid factory" do
		create(:finish).should be_valid
	end

	it "belongs to a product" do
		should belong_to(:product)
	end

	describe "#create" do
		it "is invalid when empty" do
			build(:finish, finish: nil).should_not be_valid
		end

		it "is invalid without a numeric product id" do
			build(:finish, product_id: nil).should_not be_valid
			build(:finish, product_id: "a").should_not be_valid
		end
	end
end