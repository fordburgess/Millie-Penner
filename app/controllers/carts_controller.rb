class CartsController < ApplicationController
    def show
        @cart = current_cart
        render 'cart/show'
    end

    def add_to_cart 
        current_cart.add_item(params[:product_id])        
    end

    def destroy

    end
end