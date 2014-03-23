class PromoItem < ActiveRecord::Base

	validates :product_id, presence: true, numericality: { only_integer: true }
	validates :description, presence: true

	belongs_to :product

	delegate :name, :to => :product, :prefix => true

	
end
