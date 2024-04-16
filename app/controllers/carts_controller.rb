class CartsController < ApplicationController
    def show
        @cart = current_cart
        render 'cart/show'
    end

    def add_to_cart 
        current_cart.add_item(params[:product_id])

        respond_to do|format|
            format.json { render json: current_cart.zines }
        end
    end

    def remove_from_cart
        current_cart.remove_item(params[:product_id])

        respond_to do|format|
            format.json { render json: current_cart.zines }
        end
    end

    def empty_cart
        current_cart.empty_items()
    end

    def destroy

    end
end