require 'spec_helper'

describe Product do

	it {should have_many(:sizes)}
	it {should have_many(:finishes)}
	it {should have_many(:quantities)}
	it {should have_many(:cart_items)}
	it {should have_many(:prices)}

	describe "#create" do
		it "is invalid without a name" do
			build(:product, name: nil).should_not be_valid
		end

		it "is invalid without a custom value" do
			build(:product, custom: nil).should_not be_valid
			build(:product, custom: 'a').should_not be_valid
		end
	end
end