require 'spec_helper'

describe Product do

	it "has a valid factory" do
		create(:product).should be_valid
	end

	it "has many sizes" do
		should have_many(:sizes)
	end

	it "has many finishes" do
		should have_many(:finishes)
	end

	it "has many finishes" do
		should have_many(:quantities)
	end

	describe "#create" do
		it "is invalid when empty" do
			build(:product, name: nil).should_not be_valid
		end
	end
end