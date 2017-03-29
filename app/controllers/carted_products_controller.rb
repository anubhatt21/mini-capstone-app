class CartedProductsController < ApplicationController
  
  def index
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    render "index.html.erb"
  end

  def create    
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    carted_product.save
    redirect_to "/carted_products"
  end


end
