class PaymentIntentsController < ApplicationController
    Stripe.api_key = ENV["STRIPE_SECRET_KEY_TEST"]

    def create        
        data = JSON.parse(request.body.read)       
        @shipping = data["shipping"]          
        
        def calculate_total
            initial_total = @current_cart.cart_total * 100
            grand_total = initial_total + @shipping
            grand_total.to_i
        end

        payment_intent = Stripe::PaymentIntent.create(
            amount: calculate_total,
            currency: 'gbp',            
            # In the latest version of the API, specifying the `automatic_payment_methods` parameter is optional because Stripe enables its functionality by default.
            automatic_payment_methods: {
                enabled: true,
            },
        )

        render json: { clientSecret: payment_intent.client_secret }
    end
end
