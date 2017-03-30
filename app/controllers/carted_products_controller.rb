class CartedProductsController < ApplicationController
  
  def index
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    if @carted_products.length > 0
      render "index.html.erb"
    else
      flash[:warning] = "You have no items in the cart. BUY SOMETHING NOW!!!"
      redirect_to "/carted_products"
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    flash[:success] = "Product removed!"
  end

  def create    
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id],
      status: "carted"
    )
    carted_product.save
    redirect_to "/carted_products"
  end


end
