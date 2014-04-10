require 'spec_helper'

describe Product do

  let(:ruby) { FactoryGirl.create(:product) }
  let(:sin_stock) { FactoryGirl.create(:product_sin_stock) }

  it "should not validate a new object" do
    product = Product.new
    product.should_not be_valid
  end

  it "should create a valid Product" do
    ruby.should be_valid
  end

  it "should not be available if stock is 0" do
    sin_stock.available?.should be_false
  end

  it "should have one category" do
    ruby.should_not be_nil
  end

  it "category should contain Ruby" do
    category = ruby.category
    category.products.should include(ruby)
  end
end
