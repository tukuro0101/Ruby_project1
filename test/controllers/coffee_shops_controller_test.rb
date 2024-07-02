require "test_helper"

class CoffeeShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coffee_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get coffee_shops_show_url
    assert_response :success
  end
end
