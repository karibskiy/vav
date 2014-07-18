class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :uid
      t.string :alias
      t.text :address

      t.timestamps
    end
  end
end
