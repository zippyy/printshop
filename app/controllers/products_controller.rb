class ProductsController < ApplicationController
  
  def index
  	@products = Product.all.order("name ASC") 
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

  def edit 
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
	  params.require(:product).permit(:name, :custom, sizes_attributes: [:id, :product_id, :size, :_destroy], finishes_attributes: [:id, :product_id, :finish, :_destroy], quantities_attributes: [:id, :product_id, :quantity, :_destroy] )
  end

  # def question_params
  #   params.require(:size).permit(:size, :product_id)
  # end

  # def answer_params
  #   params.require(:finish).permit(:finish, :product_id)
  # end

end
