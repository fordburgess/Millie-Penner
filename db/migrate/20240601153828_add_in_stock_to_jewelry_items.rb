class AddInStockToJewelryItems < ActiveRecord::Migration[7.1]
  def change
    add_column :jewelry_items, :in_stock, :boolean
  end
end
