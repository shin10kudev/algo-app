require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get following" do
    get :following
    assert_response :success
  end

  test "should get followers" do
    get :followers
    assert_response :success
  end

  test "should get likes" do
    get :likes
    assert_response :success
  end

end
