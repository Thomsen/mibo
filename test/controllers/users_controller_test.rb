require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "should get followers" do
  #   get :followers, :user_id => 1000
  #   assert_response :success
  # end

  test "should post follow" do
    post users_follow_url, params: {user_relations: {:id => 3}}
    assert_redirected_to mains_index_path
  end

end
