require 'test_helper'

class FixedPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get help" do
    get fixed_pages_help_url
    assert_response :success
  end

end
