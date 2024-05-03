class CreateJewelryItems < ActiveRecord::Migration[7.1]
  def change
    create_table :jewelry_items do |t|
      t.string :title
      t.text :materials
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
