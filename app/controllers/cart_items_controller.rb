class CartItemsController < ApplicationController
  
  def index
  	@cart_items = CartItem.all
  end

  def new
  	@cart_item = CartItem.new
    @cart_items = CartItem.all
  	@products = Product.all.collect {|p| [p.name, p.id]}
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	
  	if @cart_item.save
  		redirect_to new_cart_items_path
  	else
  		render :new
  	end
  end

  # def size_options
  #   @product = Product.find_by_id(params[:product_id])
  #   @sizes = @product.sizes.all.collect {|p| [p.size, p.id]}
  #   respond_to do |format|
  #      format.js {  }
  #   end
  # end

  # def finish_options
  #   @product = Product.find_by_id(params[:product_id])
  #   @finishes = @product.finishes

  #   respond_to do |format|
  #      format.js {  }
  #   end
  # end


  # def quantity_options
  #   @product = Product.find_by_id(params[:product_id])
  #   @quantities = @product.quantities

  #   respond_to do |format|
  #      format.js {  }
  #   end
  # end

  # def submit_options
  #   respond_to do |format|
  #      format.js {  }
  #   end    
  # end

  private

  def cart_item_params
  	params.require(:cart_item).permit(:product_id, :size_id, :finish_id, :quantity_id, :price_id)
  end


end
