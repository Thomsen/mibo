require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "user save" do
    @user = User.new
    assert_not @user.save, "user is not save"
    end
end
