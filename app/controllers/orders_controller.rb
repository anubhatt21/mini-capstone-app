class OrdersController < ApplicationController
  
  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)

    order = Order.new(
      quantity: params[:quantity],
      user_id: current_user.id,
      product_id: params[:product_id],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
      status: params[:status],
      )
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end
