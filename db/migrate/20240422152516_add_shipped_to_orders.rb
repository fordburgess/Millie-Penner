class AddShippedToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :shipped, :boolean, default: false
  end
end
