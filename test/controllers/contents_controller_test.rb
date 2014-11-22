require 'test_helper'

class ContentsControllerTest < ActionController::TestCase
  test "should get create" do
    assert_difference 'Content.count' do
      post :create, content: {:text => "content controller test", :user => 2}
    end
    assert_redirected_to mains_index_path(assigns(:post))
    assert_equal 'content create success', flash[:notice]
  end

  test "should get reply" do
    get :reply
    assert_response :success
  end

  test "should get forward" do
    get :forward
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy
    assert_response :success
  end

end
