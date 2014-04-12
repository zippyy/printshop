class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :email_confirmation

      t.timestamps
    end
  end
end
