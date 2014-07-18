class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :uid
      t.integer :pid
      t.boolean :pickup
      t.text :address

      t.timestamps
    end
  end
end
