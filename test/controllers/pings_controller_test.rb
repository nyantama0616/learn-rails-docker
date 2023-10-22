require "test_helper"

class PingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pings_index_url
    assert_response :success
  end
end
