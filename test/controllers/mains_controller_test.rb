require 'test_helper'

class MainsControllerTest < ActionController::TestCase
  test "should get index" do
    @request.headers["Accept"] = "text/plain, text/html"
    session[:user_id] = 2
    get :index
    assert_template :index
    assert_template layout "layouts/application"
    assert_response :success
  end

end
