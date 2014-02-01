require 'spec_helper'

describe Sizes do

	it "has a valid factory" do
		create(:size).should be_valid
	end

	describe "#create" do
		it "is invalid when empty" do
			build(:size, size: nil).should_not be_valid
		end

		it "is invalid without a numeric product id" do
			build(:size, product_id: nil).should_not be_valid
			build(:size, product_id: "a").should_not be_valid
		end
	end
end