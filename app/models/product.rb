class Product < ActiveRecord::Base

	validates :name, :presence => true

	has_many :sizes, :inverse_of => :product
	has_many :finishes, :inverse_of => :product
	has_many :quantities, :inverse_of => :product

  accepts_nested_attributes_for :sizes, allow_destroy: true, reject_if: proc { |attributes| attributes['size'].blank? }
  accepts_nested_attributes_for :finishes, allow_destroy: true, reject_if: proc { |attributes| attributes['finish'].blank? }
  accepts_nested_attributes_for :quantities, allow_destroy: true, reject_if: proc { |attributes| attributes['quantity'].blank? }
	
end
