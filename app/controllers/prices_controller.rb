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

  def edit
    @price = Price.find(params[:id])
  end

  def update
    @price = Price.find(params[:id])
  
    if @price.update_attributes(price_params)
      redirect_to new_price_url
    else
      render :edit
    end
  end


  private

  def price_params
	  params.require(:price).permit(:price, :product_id, :size_id, :finish_id, :quantity_id )
  end
end
