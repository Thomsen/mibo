require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    assert_difference 'Content.count' do
      post contents_url(@content), params: {content: {:text => "content controller test", :user => 1000}}
    end
    assert_redirected_to mains_index_path(assigns(:post))
    assert_equal 'This is a flash message', flash[:notice]
  end

  test "should get reply" do
    get contents_reply_url
    assert_response :success
  end

  # test "should get forward" do
  #   get :forward
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   delete :destroy
  #   assert_response :success
  # end

end
