class Customer < ActiveRecord::Base

	validates :name, confirmation: true  
  validates :email, presence: true
  validates :email_confirmation, presence: true

end
