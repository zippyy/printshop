class CartItemsController < ApplicationController
  
  def new
  	@cart_item = CartItem.new
    @cart_items = CartItem.all
  	@products = Product.all.map { |e| [e.name, e.id] }.sort
    @sizes = Size.all.map { |e| [e.size, e.id] }.sort
    @quantities = Quantity.all.map { |e| [e.quantity, e.id] }.sort
    @finishes = Finish.all.map { |e| [e.finish, e.id] }.sort
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	
  	if @cart_item.save
  		redirect_to new_cart_item_path
  	else
  		render :new
  	end
  end

  def product_type
    @product = Product.find(params[:product_id])
    
    respond_to do |format|
      if @product.custom
        format.js {}
      else
        @sizes = @product.sizes.map { |e| [e.size, e.id] }.sort 
        format.js { render "size_options"}  
      end
    end
  end

  def finish_options
    @product = Product.find(params[:product_id])
    @finishes = @product.finishes.map { |e| [e.finish, e.id] }.sort

    respond_to do |format|
       format.js {  }
    end
  end


  def quantity_options
    @product = Product.find(params[:product_id])
    @quantities = @product.quantities.map { |e| [e.quantity, e.id]}.sort 
    respond_to do |format|
       format.js {  }
    end
  end

  def submit_options
    @price = Price.find_by(product_id: params[:product_id], size_id: params[:size_id], finish_id: params[:finish_id], quantity_id: params[:quantity_id])

    respond_to do |format|
       format.js {  }
    end    
  end

  private

  def cart_item_params
  	params.require(:cart_item).permit(:product_id, :size_id, :finish_id, :quantity_id, :price_id, :information)
  end

end
