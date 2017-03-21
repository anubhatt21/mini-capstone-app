Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/products_url" => "products#all_products"
  # get "/product1_link" => "products#product_1"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  get "/products/:id" => "products#show"
  delete "/products/:id" => "products#destroy"
  get "random_product" => "products#random"
end
