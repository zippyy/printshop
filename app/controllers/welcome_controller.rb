class WelcomeController < ApplicationController

	def index
		@promo_items = PromoItem.all
	end

end
