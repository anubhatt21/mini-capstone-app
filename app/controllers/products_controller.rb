class ProductsController < ApplicationController
  def all_products
    @show_products = Product.all
    render "show_all_products.html.erb"
  end
end
