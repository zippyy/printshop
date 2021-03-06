class Product < ActiveRecord::Base

	validates :name, :presence => true
	validates :custom, :presence => true, :inclusion => {:in => [true, false]}

	has_many :sizes, :inverse_of => :product, :dependent => :destroy
	has_many :finishes, :inverse_of => :product, :dependent => :destroy
	has_many :quantities, :inverse_of => :product, :dependent => :destroy
	has_many :prices, :dependent => :destroy
	has_many :cart_items


  accepts_nested_attributes_for :sizes, allow_destroy: true, reject_if: proc { |attributes| attributes['size'].blank? }
  accepts_nested_attributes_for :finishes, allow_destroy: true, reject_if: proc { |attributes| attributes['finish'].blank? }
  accepts_nested_attributes_for :quantities, allow_destroy: true, reject_if: proc { |attributes| attributes['quantity'].blank? }
	
	def has_price?(size, finish, quantity)
		Price.where(product_id: self.id, size_id: size.id, finish_id: finish.id, quantity_id: quantity.id).exists?
	end

	def get_price(size, finish, quantity)
		Price.find_by(product_id: self.id, size_id: size.id, finish_id: finish.id, quantity_id: quantity.id)
	end

	def has_characteristic?(object)
		object.find_by(product_id: self.id)
	end

end
