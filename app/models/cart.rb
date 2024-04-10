class Cart < ApplicationRecord
    has_and_belongs_to_many :zines

    def add_item(product_id)
        puts "HELLO HELLO HELLO"        
        all_zines = Zine.all

        zine_in_cart = zines.where(:id => product_id).first        

        if zine_in_cart
            zine_in_cart.quantity + 1
            save
        else
            product = all_zines.where(:id => product_id).first
            zines << product
        end
        save       
    end
end
