class CartItem < ActiveRecord::Base

	belongs_to :product
	belongs_to :size
	belongs_to :finish
	belongs_to :quantity
	belongs_to :price

	delegate :name, :to => :product, :prefix => true
	delegate :size, :to => :size, :prefix => true
	delegate :finish, :to => :finish, :prefix => true
	delegate :quantity, :to => :quantity, :prefix => true
end
