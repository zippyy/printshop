require 'spec_helper'

describe Size do

	it { should belong_to(:product) }

	describe "#create" do
		it "is invalid without a size" do
			build(:size, size: nil).should_not be_valid
		end

		it "is invalid without a numeric product id" do
			build(:size, product_id: nil).should_not be_valid
			build(:size, product_id: "a").should_not be_valid
		end
	end

	describe '#destroy' do
    before do
      @size = create(:size)
      @size_id = @size.id
      @size.destroy
    end

    it 'is deleted correctly' do
      Size.exists?(id: @size_id).should be_false
    end
  end
end