class CreatePdfArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :pdf_articles do |t|
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
