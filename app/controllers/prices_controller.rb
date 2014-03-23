class PricesController < ApplicationController

  def index
  	@products = Product.all
    @price = Price.new
  end


	def create
    @price = Price.new( 
    :price => params[:price],
    :product_id => params[:product_id],
    :size_id => params[:size_id],
    :finish_id => params[:finish_id],
    :quantity_id => params[:quantity_id]
    ) 

    respond_to do |format|
  		if @price.save
  			format.js { render "create", :locals => {:id => params[:id]} }
  		else
    		render :index
  		end
    end
  end

  def edit
    @price = Price.find_by(:product_id => params[:product_id].to_i,
    :size_id => params[:size_id].to_i,
    :finish_id => params[:finish_id].to_i,
    :quantity_id => params[:quantity_id].to_i)

    respond_to do |format|
      format.js {   }
    end
  end

  def update
    @price = Price.find_by(:product_id => params[:product_id].to_i,
      :size_id => params[:size_id].to_i,
      :finish_id => params[:finish_id].to_i,
      :quantity_id => params[:quantity_id].to_i)

    respond_to do |format|
      if @price.update_attributes(:price => params[:price].to_i)
        format.js {  }
      else
        render :new
      end
    end
  end


  private

  def price_params
	  params.require(:price).permit(:price, :product_id, :size_id, :finish_id, :quantity_id )
  end
end
