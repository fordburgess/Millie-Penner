class CartsController < ApplicationController
    def show
        @cart = @current_cart
        render 'cart/show'
    end

    def destroy

    end
end