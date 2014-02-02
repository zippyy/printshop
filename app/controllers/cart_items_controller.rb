class CartItemsController < ApplicationController
  def index
  	@cart_items = CartItem.all
  end

  def new
  	@cart_item = CartItem.new
  	@products = Product.all
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	
  	if @cart_item.save
  		redirect_to cart_items_path
  	else
  		render :new
  	end
  end

  def size_options
    @product = Product.find_by_id(params[:product_id])
    @sizes = @product.sizes

    respond_to do |format|
       format.js {  }
    end
  end

  def finish_options
    @product = Product.find_by_id(params[:product_id])
    @finishes = @product.finishes

    respond_to do |format|
       format.js {  }
    end
  end


  def quantity_options
    @product = Product.find_by_id(params[:product_id])
    @quantities = @product.quantities

    respond_to do |format|
       format.js {  }
    end
  end

  private

  def cart_item_params
  	params.require(:product).permit(:product_id, :size_id, :finish_id, :quantity_id, :price_id)
  end


end
