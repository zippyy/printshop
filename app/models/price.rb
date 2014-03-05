class Price < ActiveRecord::Base

	belongs_to :prodcuts
	belongs_to :sizes
	belongs_to :quanities
	belongs_to :finishes

end
