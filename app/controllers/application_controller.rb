class ApplicationController < ActionController::Base
    before_action :current_cart
    before_action :display_cart

    def display_cart
        @display_cart = request.path.include?("zines") && !request.path.include?("admin")    
    end
    

    private
        def current_cart
            if session[:cart_id]
                cart = Cart.find_by(:id => session[:cart_id])
                if cart.present?
                    @current_cart = cart
                else
                    session[:cart_id] = nil
                end
            end

            if session[:cart_id] == nil
                @current_cart = Cart.create
                session[:cart_id] = @current_cart.id
            end
        end
end
