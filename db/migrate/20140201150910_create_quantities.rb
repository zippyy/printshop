class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
