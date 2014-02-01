class Sizes < ActiveRecord::Base

	validates :size, :presence => true
	validates :product_id, :presence => true,  numericality: { only_integer: true }

end
