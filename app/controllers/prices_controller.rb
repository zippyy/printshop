class PricesController < ApplicationController

  def index
  	@prices = Price.all
  end

  def new
  	@price = Price.new
  end

	def create
	@product = Price.new(price_params)

		if @product.save
			redirect_to products_url
		else
		render :new
		end
  end

  private

  def price_params
	  params.require(:price).permit(:price, :product_id, :size_id, :finish_id, :quantity_id )
  end
end
