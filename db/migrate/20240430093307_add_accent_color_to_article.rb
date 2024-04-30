class AddAccentColorToArticle < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :accent_color, :string
  end
end
