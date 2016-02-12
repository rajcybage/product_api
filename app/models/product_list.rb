class ProductList < ActiveRecord::Base
  store_accessor :vars
  validates :name, :sku_id, :description, :price, presence: true
  validates :price, numericality: true
  # this only execute for create not for update
  after_create :price_update
  
  def price_update
    self.update_attributes(price: self.price.to_f * 100)
  end
end
