require "test_helper"

class Public::InCartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_in_cart_products_index_url
    assert_response :success
  end
end
