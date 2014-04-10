require 'test_helper'

class WelcomeTest < ActionDispatch::IntegrationTest

  test "that welcome page say Bienvenidos" do
    get root_path
    assert_response :success # 200

    assert_select "h1", "Bienvenidos"
  end

  test "when search Ruby we recover the book" do
    get root_path
    assert_response 200

    xml_http_request :post, search_url, keyword: "ruby"
    assert_response :success
    assert_select "li", "Ruby"
  end
end
