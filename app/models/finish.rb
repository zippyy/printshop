class Finish < ActiveRecord::Base

	validates :finish, :presence => true
	validates :product_id, :presence => true,  numericality: { only_integer: true }


	belongs_to :product,  inverse_of: :finishes
	has_many :cart_items
	has_many :prices

end
