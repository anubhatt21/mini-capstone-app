Rails.application.routes.draw do
  get "/products_url" => "products#all_products"
end
