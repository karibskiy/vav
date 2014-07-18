class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :uid
      t.integer :pid

      t.timestamps
    end
  end
end
