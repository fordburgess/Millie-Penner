class Cart < ApplicationRecord
    has_and_belongs_to_many :zines

    def add_item(product_id)          
        all_zines = Zine.all

        zine_in_cart = zines.where(:id => product_id).first        

        if zine_in_cart
            # zine_in_cart.quantity + 1
            save
        else
            product = all_zines.where(:id => product_id).first
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
        zines.sum(&:price)
    end
end
