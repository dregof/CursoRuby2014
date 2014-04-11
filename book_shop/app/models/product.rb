class Product < ActiveRecord::Base
  # Callbacks
  before_validation :set_price
  before_save :set_stock_and_position

  # Asociaciones
  belongs_to :category

  # Validaciones
  # validates_associated :category
  validates :name, :reference, :description, :price, presence: true
  validates :reference, :price, numericality: true
  validates :reference, uniqueness: true

  def decimal_price
    price.to_f / 100.0
  end

  class << self
    Product.column_names.each { |attr|
      define_method "find_by_#{attr}" do |value|
        find_by(attr.to_sym, value)
      end
    }
  end

  def available?
    stock > 0
  end

  def as_json(options = {})
    default = {
      except: [:created_at, :updated_at, :postion],
      methods: [:decimal_price]
    }
    options.merge! default
    super(options)
  end

private
  def set_price
    self.price = self.price * 100
  end

  def set_stock_and_position
    self.position = Product.all.size + 1
  end
end
