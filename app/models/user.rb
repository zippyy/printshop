class User < ActiveRecord::Base
  authenticates_with_sorcery!

	validates :password, confirmation: true  
  validates :email, presence: true,  uniqueness: true, on: :create
end
