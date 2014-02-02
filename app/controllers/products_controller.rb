class ProductsController < ApplicationController
  
  def index
  	@products = Product.all
  end


  def new
  	@product = Product.new
    4.times { @product.sizes.build }
    3.times { @product.finishes.build }
    5.times { @product.quantities.build }
  end

  def create
	  @product = Product.new(product_params)

  	if @product.save
  		redirect_to products_url
  	else
  		render :new
  	end
  end

  private

  def product_params
	  params.require(:product).permit(:name, sizes_attributes: [:id, :product_id, :size, :_destroy], finishes_attributes: [:id, :product_id, :finish, :_destroy], quantities_attributes: [:id, :product_id, :quantity, :_destroy] )
  end

  def question_params
    params.require(:size).permit(:size, :product_id)
  end

  def answer_params
    params.require(:finish).permit(:finish, :product_id)
  end

end
