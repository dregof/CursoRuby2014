require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "should get add_product" do
    get :add_product
    assert_response :success
  end

end
