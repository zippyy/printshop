require 'spec_helper'

describe Quantity do

	it "has a valid factory" do
		create(:quantity).should be_valid
	end

	it "belongs to a product" do
		should belong_to(:product)
	end

	describe "#create" do
		it "is invalid when empty" do
			build(:quantity, quantity: nil).should_not be_valid
		end

		it "is invalid without a numberical value" do
			build(:quantity, quantity: nil).should_not be_valid

		end

		it "is invalid without a numeric product id" do
			build(:quantity, product_id: nil).should_not be_valid
			build(:quantity, product_id: "a").should_not be_valid
		end
	end
end