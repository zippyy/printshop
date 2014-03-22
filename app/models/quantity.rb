class Quantity < ActiveRecord::Base

	validates :quantity, :presence => true,  numericality: { only_integer: true }
	validates :product_id, :presence => true,  numericality: { only_integer: true }

	belongs_to :product,  inverse_of: :quantities
	# has_many :cart_items #not sure if needed
	# has_many :prices #not sure if needed
		
end
