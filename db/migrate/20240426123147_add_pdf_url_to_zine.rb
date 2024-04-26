class AddPdfUrlToZine < ActiveRecord::Migration[7.1]
  def change
    add_column :zines, :pdf_url, :string
  end
end
