class Product < ActiveRecord::Base
  # Callbacks
  before_validation :set_price
  before_save :set_stock_and_position

  # Asociaciones
  belongs_to :category

  # Validaciones
  validates_associated :category
  validate :name, :reference, :description, :price, presence: true
  validate :reference, :price, numericality: true

private
  def set_price
    self.price = self.price * 100
  end

  def set_stock_and_position
    self.stock = 1000
    self.position = Product.all.size + 1
  end
end
