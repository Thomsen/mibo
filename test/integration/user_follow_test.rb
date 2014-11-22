require 'test_helper'

class UserFollowTest < ActionDispatch::IntegrationTest

  fixtures :users

  test "login and enter site" do
    # login via https
    https!
    get "/users/login"
    assert_response :success

    post_via_redirect "/users/login", user: {:username => users(:usrone).username, :password => users(:usrone).password}
    assert_equal '/mains/index', path
    assert_equal 'Welcome !', flash[:notice]

    https!(false)
    get "/mains/index"
    assert_response :success
    assert assigns(:contents)
  end
  
end
