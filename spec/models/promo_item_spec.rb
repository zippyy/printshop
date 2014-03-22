require 'spec_helper'

describe PromoItem do
 
	it { should belong_to(:product) }

	describe "#create" do
		it "is invalid without a description" do
			build(:promo_item, description: nil).should_not be_valid
		end

		it "is invalid without a numeric product id" do
			build(:promo_item, product_id: nil).should_not be_valid
			build(:promo_item, product_id: "a").should_not be_valid
		end
	end

	describe '#destroy' do
    before do
      @promo_item = create(:promo_item)
      @promo_item_id = @promo_item.id
      @promo_item.destroy
    end

    it 'is deleted correctly' do
      PromoItem.exists?(id: @promo_item_id).should be_false
    end
  end

end
