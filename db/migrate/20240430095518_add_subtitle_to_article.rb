class AddSubtitleToArticle < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :subtitle, :string
  end
end
