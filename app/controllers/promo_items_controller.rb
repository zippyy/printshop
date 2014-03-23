class PromoItemsController < ApplicationController

  def index
  	@promo_items = PromoItem.all
  end

  def new
  	@promo_item = PromoItem.new
    @products = Product.all.map { |e| [e.name, e.id] }.sort
	end

	def create
		@promo_item = PromoItem.new(promo_item_params)

  	if @promo_item.save
  		redirect_to promo_items_url
  	else
  		render :new
  	end
	end

	def edit
		@promo_item = PromoItem.find(params[:id])
    @products = Product.all.map { |e| [e.name, e.id] }.sort
	end

	def update
		@promo_item = PromoItem.find(params[:id])

		if @promo_item.update_attributes(promo_item_params)
      redirect_to promo_items_path 
    else
      render :edit
    end
	end

  def destroy
    @promo_item = PromoItem.find(params[:id])
    @promo_item.destroy
    redirect_to promo_items_url
  end

	private

	def promo_item_params
    params.require(:promo_item).permit(:product_id, :description) 
	end

end
