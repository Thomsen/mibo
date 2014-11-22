require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get followers" do
    get :followers, :user_id => 2
    assert_response :success
  end

  test "should post follow" do
    post :follow, user_relations: {:id => 3}
    assert_redirected_to mains_index_path
  end

end
