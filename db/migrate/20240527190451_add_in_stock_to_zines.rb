class AddInStockToZines < ActiveRecord::Migration[7.1]
  def change
    add_column :zines, :in_stock, :boolean
  end
end
