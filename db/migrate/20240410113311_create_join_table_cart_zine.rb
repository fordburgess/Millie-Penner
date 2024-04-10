class CreateJoinTableCartZine < ActiveRecord::Migration[7.1]
  def change
    create_join_table :carts, :zines do |t|
      # t.index [:cart_id, :zine_id]
      # t.index [:zine_id, :cart_id]
    end
  end
end
