require 'test_helper'

class GetstartedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get getstarted_index_url
    assert_response :success
  end

  test "should get auth" do
    get getstarted_auth_url
    assert_response :success
  end

  test "should get failure" do
    get getstarted_failure_url
    assert_response :success
  end

end
