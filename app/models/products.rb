class Products < ActiveRecord::Base

	validates :name, :presence => true

end
