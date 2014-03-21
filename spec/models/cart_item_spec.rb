require 'spec_helper'

describe CartItem do
 
 	it "has a valid factory" do
 		create(:cart_item).should be_valid
 	end
end
