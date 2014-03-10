class AddSpecial < ActiveRecord::Migration
  def change
  	add_column :products, :custom, :boolean
  end
end
