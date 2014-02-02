class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :size_id
      t.integer :finish_id
      t.integer :quantity_id
      t.integer :price_id

      t.timestamps
    end
  end
end
