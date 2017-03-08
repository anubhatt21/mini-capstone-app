class ProductsController < ApplicationController
  def all_products
    @show_products = Product.all
    render "show_all_products.html.erb"
  end
  def product_1
    @product1_image = Product.all 
    render "product1_image_link.html.erb"
  end
end
