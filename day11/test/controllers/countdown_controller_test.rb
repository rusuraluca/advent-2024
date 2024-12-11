require "test_helper"

class CountdownControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get countdown_index_url
    assert_response :success
  end
end
