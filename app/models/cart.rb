class Cart < ApplicationRecord
    has_and_belongs_to_many :zines   
    has_and_belongs_to_many :jewelry_items 

    def all_products        
        zines + jewelry_items
    end

    def add_item(type, product_id)          
        
        product = type.constantize.find(product_id)

        if type == "JewelryItem"
            jewelry_items << product
        elsif type == "Zine"
            zines << product
        end

        save
     
    end

    def remove_item(product_id)
        all_zines = Zine.all

        product = zines.where(:id => product_id).first

        if product
            zines.delete(product)
        end
    end

    def empty_items
        if zines.length() > 0
            zines.clear()
        end

        puts "HELLO HELLO"
        puts zines
    end

    def cart_total
        jewelry_items.sum(&:price) + zines.sum(&:price)
    end
end
