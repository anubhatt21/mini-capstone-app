class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :cartedproducts
  has_many :products, through: :carted_products
end
