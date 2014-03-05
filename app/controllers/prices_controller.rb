class PricesController < ApplicationController

  def index
  	@prices = Price.all
  end

  def new
  	@products = Product.all
    @price = Price.new
  end

	def create
	@price = Price.new(price_params)

		if @price.save
			redirect_to new_price_url
		else
		render :new
		end
  end

  private

  def price_params
	  params.require(:price).permit(:price, :product_id, :size_id, :finish_id, :quantity_id )
  end
end
