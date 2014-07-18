require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get orders" do
    get :orders
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get orders" do
    get :orders
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

end
