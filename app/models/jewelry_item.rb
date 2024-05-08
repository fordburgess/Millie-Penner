class JewelryItem < ApplicationRecord
    has_many_attached :images
    has_and_belongs_to_many :carts
    
    validates_presence_of :title, :price, :materials, :description
end
