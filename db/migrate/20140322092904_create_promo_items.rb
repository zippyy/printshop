class CreatePromoItems < ActiveRecord::Migration
  def change
    create_table :promo_items do |t|
      t.integer :product_id
      t.text :description

      t.timestamps
    end
  end
end
