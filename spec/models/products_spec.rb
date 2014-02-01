require 'spec_helper'

describe Products do

	it "has a valid factory" do
		create(:product).should be_valid
	end

	describe "#create" do
		it "is invalid when empty" do
			build(:product, name: nil).should_not be_valid
		end
	end
end