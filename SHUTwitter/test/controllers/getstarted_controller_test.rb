require 'test_helper'

class GetstartedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get getstarted_index_url
    assert_response :success
  end

end
