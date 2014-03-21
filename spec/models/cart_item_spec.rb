require 'spec_helper'

describe CartItem do
 
	it { should belong_to :product }
	it { should belong_to :size }
	it { should belong_to :finish }
	it { should belong_to :quantity }
	it { should belong_to :price }

	context "custom items" do
		
		it "has no size_id" do
			build(:cart_item, size_id: nil).should be_valid
		end

		it "has no finish_id" do
			build(:cart_item, finish_id: nil).should be_valid
		end

		it "has no quantiy_id" do
			build(:cart_item, quantity_id: nil).should be_valid
		end

		it "has no price_id" do
			build(:cart_item, price_id: nil).should be_valid
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
			build(:cart_item, quantity_id: "a").should_not be_valid
		end

		it "has a numeric price_id" do
			build(:cart_item, price_id: "a").should_not be_valid
		end
	end


	
end
