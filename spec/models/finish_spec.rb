require 'spec_helper'

describe Finish do

	it { should belong_to(:product) }
	it { should have_many(:cart_items)}
	it { should have_many(:prices)}

	describe "#create" do
		it "is invalid when empty" do
			build(:finish, finish: nil).should_not be_valid
		end

		it "is invalid without a numeric product id" do
			build(:finish, product_id: nil).should_not be_valid
			build(:finish, product_id: "a").should_not be_valid
		end
	end

  describe '#destroy' do
    before do
      @finish = create(:finish)
      @finish_id = @finish.id
      @finish.destroy
    end

    it 'is deleted correctly' do
      Finish.exists?(id: @finish_id).should be_false
    end
  end
end