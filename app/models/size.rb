class Size < ActiveRecord::Base

	validates :size, :presence => true
	validates :product_id, :presence => true,  numericality: { only_integer: true }

	
	belongs_to :product,  inverse_of: :sizes
	has_many :cart_items
	has_many :prices

end
