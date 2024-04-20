class PaymentIntentsController < ApplicationController
    Stripe.api_key = ''

    def create        
        data = JSON.parse(request.body.read)       
        
        puts "HELLO HELLO"
        puts Stripe.api_key

        payment_intent = Stripe::PaymentIntent.create(
            amount: 1400,
            currency: 'gbp',            
            # In the latest version of the API, specifying the `automatic_payment_methods` parameter is optional because Stripe enables its functionality by default.
            automatic_payment_methods: {
                enabled: true,
            },
        )

        render json: { clientSecret: payment_intent.client_secret }        
    end
end
