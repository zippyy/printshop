require 'spec_helper'

describe Quantity do

	it { should belong_to(:product) }

	describe "#create" do
		it "is invalid when empty" do
			build(:quantity, quantity: nil).should_not be_valid
		end

		it "is invalid without a numerical quantity" do
			build(:quantity, quantity: nil).should_not be_valid
			build(:quantity, quantity: "a").should_not be_valid
		end

		it "is invalid without a numeric product id" do
			build(:quantity, product_id: nil).should_not be_valid
			build(:quantity, product_id: "a").should_not be_valid
		end
	end

	describe '#destroy' do
    before do
      @quantity = create(:quantity)
      @quantity_id = @quantity.id
      @quantity.destroy
    end

    it 'is deleted correctly' do
      Quantity.exists?(id: @quantity_id).should be_false
    end
  end
end