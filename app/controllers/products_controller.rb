class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    render "show_all_products.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    product = Product.new(
      name: params[:form_name],
      price: params[:form_price],
      image: params[:form_image],
      description: params[:form_description]
    )
    product.save
    render "create.html.erb"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.price = params[:form_price]
    @product.image = params[:form_image]
    @product.description = params[:form_description]
    @product.save
    render "update.html.erb"
  end


  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    # @product = Product.name
    render "show_products.html.erb"
  end

  def all_products
    @show_products = Product.all
    render "show_all_products.html.erb"
  end
  
  def product_1
    @product1_image = Product.all 
    render "product1_image_link.html.erb"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    # @product.name = params[:form_name]
    # @product.price = params[:form_price]
    # @product.image = params[:form_image]
    # @product.description = params[:form_description]
    @product.destroy
    render "destroy.html.erb"
  end

end
