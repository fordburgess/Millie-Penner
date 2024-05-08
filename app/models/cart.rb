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

    def remove_item(type, product_id)
        puts "HELLO HELLO"
        puts product_id
        
        if type == "Zine"
            product = zines.where(:id => product_id).first
            if product
                zines.delete(product)
            end
        elsif type == "JewelryItem"     
            product = jewelry_items.where(:id => product_id).first
            if product
                jewelry_items.delete(product)
            end
        end        
    end

    def empty_items
        if zines.length() > 0
            zines.clear()
        end

        if jewelry_items.length() > 0
            jewelry_items.clear()
        end
    end

    def cart_total
        jewelry_items.sum(&:price) + zines.sum(&:price)
    end
end
