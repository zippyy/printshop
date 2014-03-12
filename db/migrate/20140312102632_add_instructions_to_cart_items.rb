class AddInstructionsToCartItems < ActiveRecord::Migration
  def change
  	add_column :cart_items, :information, :text
  end
end
