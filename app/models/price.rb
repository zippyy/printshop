class Price < ActiveRecord::Base

	validates :product_id, :presence => true,  numericality: { only_integer: true }
	validates :size_id, :presence => true,  numericality: { only_integer: true }
	validates :quantity_id, :presence => true,  numericality: { only_integer: true }
	validates :finish_id, :presence => true,  numericality: { only_integer: true }

	belongs_to :product
	belongs_to :size
	belongs_to :quantity
	belongs_to :finish

end
