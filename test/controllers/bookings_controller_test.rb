require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get bookings_confirm_url
    assert_response :success
  end
end
