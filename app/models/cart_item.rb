class CartItem < ActiveRecord::Base

	validates :product_id, :presence => true,  numericality: { only_integer: true }
	validates :size_id, numericality: { only_integer: true }, :allow_nil => true
	validates :finish_id, numericality: { only_integer: true }, :allow_nil => true
	validates :quantity_id, numericality: { only_integer: true }, :allow_nil => true
	validates :price_id, numericality: { only_integer: true }, :allow_nil => true

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
