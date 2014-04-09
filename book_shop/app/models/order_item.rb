class OrderItem < ActiveRecord::Base

  # Callbacks
  before_save :calculate_total_price
  after_save :destroy_if_quatity_zero

  # Asociaciones
  belongs_to :product
  belongs_to :order

  # Validaciones
  validates :product_id, :order_id, presence: true
  validates_associated :product, :order, on: :create
  validates :quatity, :total_price, presence: true
  valitates :quatity, :total_price, numericality: true {only_integer: true}

private
  def calculate_total_price
    self.total_price = product.price * self.quatity
  end

  def destroy_if_quatity_zer
    self.delete if quatity == 0
  end
end
