class CreateZines < ActiveRecord::Migration[7.1]
  def change
    create_table :zines do |t|
      t.string :title
      t.decimal :price
      t.string :size
      t.integer :pages
      t.text :description

      t.timestamps
    end
  end
end
