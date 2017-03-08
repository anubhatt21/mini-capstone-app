Rails.application.routes.draw do
  get "/products_url" => "products#all_products"
  get "/product1_link" => "products#product_1"
end
