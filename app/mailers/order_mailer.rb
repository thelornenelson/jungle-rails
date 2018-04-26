class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order)
    @order = order
    @url = 'http://localhost:3000'
    mail(to: @order.email, subject: @order.id)
  end


end
