require 'test_helper'

class MarketingStrategiesControllerTest < ActionController::TestCase
  setup do
    @marketing_strategy = marketing_strategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marketing_strategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marketing_strategy" do
    assert_difference('MarketingStrategy.count') do
      post :create, marketing_strategy: { name: @marketing_strategy.name }
    end

    assert_redirected_to marketing_strategy_path(assigns(:marketing_strategy))
  end

  test "should show marketing_strategy" do
    get :show, id: @marketing_strategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marketing_strategy
    assert_response :success
  end

  test "should update marketing_strategy" do
    put :update, id: @marketing_strategy, marketing_strategy: { name: @marketing_strategy.name }
    assert_redirected_to marketing_strategy_path(assigns(:marketing_strategy))
  end

  test "should destroy marketing_strategy" do
    assert_difference('MarketingStrategy.count', -1) do
      delete :destroy, id: @marketing_strategy
    end

    assert_redirected_to marketing_strategies_path
  end
end
