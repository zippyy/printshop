class Size < ActiveRecord::Base

	validates :size, :presence => true
	
	belongs_to :product,  inverse_of: :sizes
	has_many :cart_items

end
