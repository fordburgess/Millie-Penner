class CreateJoinTableOrderZine < ActiveRecord::Migration[7.1]
  def change
    create_join_table :orders, :zines do |t|
      # t.index [:order_id, :zine_id]
      # t.index [:zine_id, :order_id]
    end
  end
end
