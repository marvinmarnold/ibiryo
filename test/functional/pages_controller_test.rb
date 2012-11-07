require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get security" do
    get :security
    assert_response :success
  end

  test "should get feedback" do
    get :feedback
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get legal" do
    get :legal
    assert_response :success
  end

end
