require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "that category books cointains ruby" do
    category = categories(:books)
    ruby = products(:ruby)
    assert category.products.include? ruby
  end
end
