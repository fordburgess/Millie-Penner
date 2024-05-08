class CartsController < ApplicationController    

    def show
        @cart = current_cart        
        render json: @cart.zines
    end

    def add_to_cart 
        current_cart.add_item(params[:product_type], params[:product_id])

        flash[:notice] = "Item added!"

        redirect_back fallback_location: root_path
    end

    def remove_from_cart        
        current_cart.remove_item(params[:product_id])    
        head :no_content 
    end

    def empty_cart
        current_cart.empty_items()
    end

    def destroy
        current_cart.destroy()
    end
end