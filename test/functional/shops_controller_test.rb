require 'test_helper'

class ShopsControllerTest < ActionController::TestCase
  setup do
    @shop = shops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post :create, shop: { banner: @shop.banner, checkin_at: @shop.checkin_at, checkout_at: @shop.checkout_at, closes_friday_at: @shop.closes_friday_at, closes_monday_at: @shop.closes_monday_at, closes_saturday_at: @shop.closes_saturday_at, closes_sunday_at: @shop.closes_sunday_at, closes_thursday_at: @shop.closes_thursday_at, closes_tuesday_at: @shop.closes_tuesday_at, closes_wednesday_at: @shop.closes_wednesday_at, currency: @shop.currency, delivery_fee: @shop.delivery_fee, delivery_minimum: @shop.delivery_minimum, is_active: @shop.is_active, opens_friday_at: @shop.opens_friday_at, opens_monday_at: @shop.opens_monday_at, opens_saturday_at: @shop.opens_saturday_at, opens_sunday_at: @shop.opens_sunday_at, opens_thursday_at: @shop.opens_thursday_at, opens_tuesday_at: @shop.opens_tuesday_at, opens_wednesday_at: @shop.opens_wednesday_at, thumbnail: @shop.thumbnail }
    end

    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should show shop" do
    get :show, id: @shop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop
    assert_response :success
  end

  test "should update shop" do
    put :update, id: @shop, shop: { banner: @shop.banner, checkin_at: @shop.checkin_at, checkout_at: @shop.checkout_at, closes_friday_at: @shop.closes_friday_at, closes_monday_at: @shop.closes_monday_at, closes_saturday_at: @shop.closes_saturday_at, closes_sunday_at: @shop.closes_sunday_at, closes_thursday_at: @shop.closes_thursday_at, closes_tuesday_at: @shop.closes_tuesday_at, closes_wednesday_at: @shop.closes_wednesday_at, currency: @shop.currency, delivery_fee: @shop.delivery_fee, delivery_minimum: @shop.delivery_minimum, is_active: @shop.is_active, opens_friday_at: @shop.opens_friday_at, opens_monday_at: @shop.opens_monday_at, opens_saturday_at: @shop.opens_saturday_at, opens_sunday_at: @shop.opens_sunday_at, opens_thursday_at: @shop.opens_thursday_at, opens_tuesday_at: @shop.opens_tuesday_at, opens_wednesday_at: @shop.opens_wednesday_at, thumbnail: @shop.thumbnail }
    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete :destroy, id: @shop
    end

    assert_redirected_to shops_path
  end
end
