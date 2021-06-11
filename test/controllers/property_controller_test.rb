require "test_helper"

class PropertyControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get property_top_url
    assert_response :success
  end
end
