class OrderMailer < ApplicationMailer
  default from: 'orders@millicentpenner.com'
  
  def order_confirmation(order)    
    @order = order
    mail(to: @order.email, subject: "Order No. #{order.id} Confirmation")
  end
end
