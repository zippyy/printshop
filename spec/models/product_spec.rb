require 'spec_helper'

describe Product do

	it { should have_many(:sizes) }
	it { should have_many(:finishes) }
	it { should have_many(:quantities) }
	it { should have_many(:cart_items) }
	it { should have_many(:prices) }
	# it { should have_many(:promo_items)}

	describe "#create" do
		it "is invalid without a name" do
			build(:product, name: nil).should_not be_valid
		end

		it "is invalid without a custom value" do
			build(:product, custom: nil).should_not be_valid
			build(:product, custom: 'a').should_not be_valid
		end
	
		context "with nested attributes" do

			before(:each) do 
				@product = create(:product) do |product|
				  @finish = product.finishes.create(attributes_for(:finish))
				  @quantity = product.quantities.create(attributes_for(:quantity))
				  @size = product.sizes.create(attributes_for(:size))
				end
				end

			it "creates a product" do
	      Product.exists?(id: @product.id).should be_true
			end

			it "accepts nested attributes for finish" do
	      Finish.exists?(id: @finish.id, product_id: @product.id).should be_true
			end

			it "accepts nested attributes for quantity" do
	      Quantity.exists?(id: @quantity.id, product_id: @product.id).should be_true

			end

			it "accepts nested attributes for size" do
	      Size.exists?(id: @size.id, product_id: @product.id).should be_true
			end
		end
	end

	describe '#destroy' do
		before(:each) do 
			@product = create(:product) do |product|
			  @finish = product.finishes.create(attributes_for(:finish))
			  @quantity = product.quantities.create(attributes_for(:quantity))
			  @size = product.sizes.create(attributes_for(:size))
			end
			@price = create(:price, product_id: @product.id, finish_id: @finish.id, size_id: @size.id, quantity_id: @quantity.id)
			@product_id = @product.id
			@finish_id = @finish.id
			@quantity_id = @quantity.id
			@size_id = @size.id
			@price_id = @price.id
			@product.destroy
		end

		it "deletes the product" do
      Product.exists?(id: @product_id).should be_false
		end

		context "deletes the associated records" do
			it "deletes the finish" do
	      Finish.exists?(id: @finish_id).should be_false
			end
			it "deletes the quantity" do
	      Quantity.exists?(id: @quantity_id).should be_false
			end
			it "deletes the size" do
	      Size.exists?(id: @size_id).should be_false
			end

			it "deletes the price" do
				Price.exists?(id: @price.id).should be_false
			end
		end
	end
end