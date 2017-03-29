class Product < ApplicationRecord
  
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products
  
  def discounted?
    price.to_i < 2
  end

  def tax
    return price.to_f * 0.09
  end

  def total
    return price.to_f + tax
  end

end
