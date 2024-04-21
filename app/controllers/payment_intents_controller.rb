class PaymentIntentsController < ApplicationController
    Stripe.api_key = ''

    def create        
        data = JSON.parse(request.body.read)   
        
        def calculate_total
            total = @current_cart.cart_total * 100
            total.to_i
        end

        payment_intent = Stripe::PaymentIntent.create(
            amount: 30,
            currency: 'gbp',            
            # In the latest version of the API, specifying the `automatic_payment_methods` parameter is optional because Stripe enables its functionality by default.
            automatic_payment_methods: {
                enabled: true,
            },
        )

        render json: { clientSecret: payment_intent.client_secret }
    end
end
