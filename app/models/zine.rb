class Zine < ApplicationRecord
    has_one_attached :cover_image
    has_one_attached :background_image
    has_one_attached :zine_pdf
    has_many_attached :pdf_images
    has_and_belongs_to_many :carts

    has_many :line_items
    has_and_belongs_to_many :orders

    validates_presence_of :title, :price, :size, :pages, :zine_pdf, :background_image, :cover_image, :description    
end
