require 'spec_helper'

describe CartItem do
 
 	it "has a valid factory" do
 		create(:cart_item).should be_valid
 	end

 	let(:cart_item) { create(:cart_item) }

 	it "belongs to product" do 
		cart_item.should belong_to(:product)
	end

	context "custom items" do
		it "can have no size_id" do
			build(:cart_item, size_id: nil).should be_valid
		end

		it "can have no finish_id" do
			build(:cart_item, finish_id: nil).should be_valid
		end

		it "can have no quantiy_id" do
			build(:cart_item, finish_id: nil).should be_valid
		end

		it "can have no price_id" do
			build(:cart_item, finish_id: nil).should be_valid
		end
	end

	context "standard items" do
		it "has a numeric size_id" do
			build(:cart_item, size_id: "a").should_not be_valid
		end

		it "has a numeric finish_id" do
			build(:cart_item, finish_id: "a").should_not be_valid
		end

		it "has a numeric quantiy_id" do
			build(:cart_item, finish_id: "a").should_not be_valid
		end

		it "has a numeric price_id" do
			build(:cart_item, finish_id: "a").should_not be_valid
		end
	end


end
