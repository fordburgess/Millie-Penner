class CartsController < ApplicationController
    def show
        @cart = current_cart
        render 'cart/show'
    end

    def add_to_cart 
        current_cart.add_item(params[:product_id])        
    end

    def remove_from_cart
        current_cart.remove_item(params[:product_id])
    end

    def empty_cart
        current_cart.empty_items()
    end

    def destroy

    end
end