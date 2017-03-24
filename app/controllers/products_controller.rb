class ProductsController < ApplicationController
  
  def index
    if session[:count] == nil
      session[:count] = 0
    end
    session[:count] += 1
    @page_count = session[:count]
    
    if params[:discounted] == "true"
      @products = Product.where("price < ?", 10)
    else
      sort_attribute = params[:sort_by] || "name"
      sort_attribute_order = params[:sort_order] || "asc"
      @products = Product.all.order(sort_attribute => sort_attribute_order)
    end
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:form_name],
      price: params[:form_price],
      description: params[:form_description],
      supplier_id: 1
    )
    @product.save
    image = Image.new(
      url: params[:image],
      product_id: @product.id
      )
    image.save
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
    if params[:id] == "random"
      @product = Product.all.sample
    else
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
    end
    render "show_products.html.erb"
  end


  def all_products
    @show_products = Product.all
    render "show_all_products.html.erb"
  end
  
  # def product_1
  #   @product1_image = Product.all 
  #   render "product1_image_link.html.erb"
  # end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render "destroy.html.erb"
  end

  

end
