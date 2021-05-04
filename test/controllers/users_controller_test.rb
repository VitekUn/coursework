require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end
end
