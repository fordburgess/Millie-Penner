class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :product
      t.string :address
      t.string :pay_method
      t.decimal :total

      t.timestamps
    end
  end
end
