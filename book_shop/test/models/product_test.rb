require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = products(:ruby)
  end

  test "that a new product is not valid" do
    product_invalid = Product.new
    assert !product_invalid.valid?
  end

  test "object should be valid and created" do
    assert @product.valid?
    @product.save
    assert_not_nil @product.id, "después de guardar debe de tener un valor asignado"
  end

  test "name should be presence" do
    @product.name = nil
    assert_presence @product, :name
  end

  test "description should be presence" do
    @product.description = nil
    assert_presence @product, :description
  end

  test "that a product with stock 0 is not available" do
    sin_stock = products(:sin_stock)
    assert !sin_stock.available?
  end

  test "that Ruby belogns_to Books" do
    @category = categories(:books)
    assert_not_nil @product.category
    assert_equal @product.category.name, @category.name
  end
end











