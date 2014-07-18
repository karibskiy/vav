class AddShipmentToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :building_no, :string
    add_column :orders, :street_name, :string
    add_column :orders, :locality_name, :string
    add_column :orders, :city, :string
    add_column :orders, :pincode, :integer
    add_column :orders, :mobile, :integer
  end
end
