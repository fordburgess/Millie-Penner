class CreateJoinTableCartJewelryItem < ActiveRecord::Migration[7.1]
  def change
    create_join_table :carts, :jewelry_items do |t|
      # t.index [:cart_id, :jewelry_item_id]
      # t.index [:jewelry_item_id, :cart_id]
    end
  end
end
