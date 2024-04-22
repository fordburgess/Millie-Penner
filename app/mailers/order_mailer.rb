class OrderMailer < ApplicationMailer
  
  def order_confirmation(order)
    puts "HELLO HELLO"
    puts order.id
    puts order.email
    @order = order
    mail(to: @order.email, subject: "Order No. #{order.id} Confirmation")
  end
end
