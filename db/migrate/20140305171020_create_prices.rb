class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :price
      t.integer :product_id
      t.integer :size_id
      t.integer :finish_id
      t.integer :quantity_id

      t.timestamps
    end
  end
end
