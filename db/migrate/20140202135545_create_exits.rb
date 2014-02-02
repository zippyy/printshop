class CreateExits < ActiveRecord::Migration
  def change
    create_table :exits do |t|

      t.timestamps
    end
  end
end
