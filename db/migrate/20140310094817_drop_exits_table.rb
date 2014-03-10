class DropExitsTable < ActiveRecord::Migration
  def change
  	drop_table :exits
  end
end
