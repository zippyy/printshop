class CartItemsController < ApplicationController
  
  def index
  	@cart_items = CartItem.all
  end

  def new
  	@cart_item = CartItem.new
    @cart_items = CartItem.all
  	@products = Product.all.map { |e| [e.name, e.id] }
    @sizes = Size.all.map { |e| [e.size, e.id] }
    @quantities = Quantity.all.map { |e| [e.quantity, e.id] }
    @finishes = Finish.all.map { |e| [e.finish, e.id] }
    @f=nil
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	
  	if @cart_item.save
  		redirect_to new_cart_item_path
  	else
  		render :new
  	end
  end

  def size_options
    @product = Product.find_by_id(params[:product_id])
    @sizes = @product.sizes.map { |e| [e.size, e.id] }

    respond_to do |format|
       format.js {  }
    end
  end

  def finish_options
    @product = Product.find_by_id(params[:product_id])
    @finishes = @product.finishes.map { |e| [e.finish, e.id] }

    respond_to do |format|
       format.js {  }
    end
  end


  def quantity_options
    @product = Product.find_by_id(params[:product_id])
    @quantities = @product.quantities.map { |e| [e.quantity, e.id] }

    respond_to do |format|
       format.js {  }
    end
  end

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
