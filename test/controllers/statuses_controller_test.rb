require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get reply" do
    get :reply
    assert_response :success
  end

  test "should get forward" do
    get :forward
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
