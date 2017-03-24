class Product < ApplicationRecord
  
  belongs_to :supplier
  has_many :images
  has_many :orders
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
