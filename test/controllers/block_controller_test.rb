require 'test_helper'

class BlockControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get block_index_url
    assert_response :success
  end

  test "should get blocking" do
    get block_blocking_url
    assert_response :success
  end

end
