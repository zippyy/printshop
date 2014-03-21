require 'spec_helper'

describe Price do
  
	it { should belong_to(:product) }
	it { should belong_to(:size)}
	it { should belong_to(:quantity)}
	it { should belong_to(:finish)}

	describe "#create" do

		it "has a numerical product_id" do
			build(:price, product_id: nil).should_not be_valid
			build(:price, product_id: "a").should_not be_valid
		end

		it "has a numerical size_id" do
			build(:price, size_id: nil).should_not be_valid
			build(:price, size_id: "a").should_not be_valid
		end

		it "has a numerical quantity_id" do
			build(:price, quantity_id: nil).should_not be_valid
			build(:price, quantity_id: "a").should_not be_valid
		end

		it "has a numerical finish_id" do
			build(:price, finish_id: nil).should_not be_valid
			build(:price, finish_id: "a").should_not be_valid
		end
	end

	 describe '#destroy' do
    before do
      @price = create(:price)
      @price_id = @price.id
      @price.destroy
    end

    it 'is deleted correctly' do
      Price.exists?(id: @price_id).should be_false
    end
  end

end
