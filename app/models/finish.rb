class Finish < ActiveRecord::Base

	validates :finish, :presence => true

	belongs_to :product,  inverse_of: :finishes
	has_many :cart_items

end
