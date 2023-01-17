require "test_helper"

class Public::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_deliveries_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_deliveries_edit_url
    assert_response :success
  end
end
