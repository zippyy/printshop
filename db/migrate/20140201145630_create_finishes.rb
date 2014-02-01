class CreateFinishes < ActiveRecord::Migration
  def change
    create_table :finishes do |t|
      t.integer :product_id
      t.string :finish

      t.timestamps
    end
  end
end
