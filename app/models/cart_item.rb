class CartItem < ActiveRecord::Base

	belongs_to :product
	belongs_to :size
	belongs_to :finish
	belongs_to :quantity
	belongs_to :price

	delegate :name, :to => :product, :prefix => true
	delegate :size, :to => :size, :prefix => true, :allow_nil => true
	delegate :finish, :to => :finish, :prefix => true, :allow_nil => true
	delegate :quantity, :to => :quantity, :prefix => true, :allow_nil => true
	delegate :price, :to => :price, :prefix => true, :allow_nil => true
end
