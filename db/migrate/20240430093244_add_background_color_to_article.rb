class AddBackgroundColorToArticle < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :background_color, :string
  end
end
