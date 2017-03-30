class OrdersController < ApplicationController
  
  def create
    order = Order.new(user_id: current_user.id)
    order.save

    carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    carted_products.update_all(status: "purchased", order_id: order.id)

    order.calculate_totals
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end
