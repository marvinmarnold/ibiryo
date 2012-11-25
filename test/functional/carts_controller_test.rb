require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, cart: { billed_card_expiration: @cart.billed_card_expiration, billed_card_last_four: @cart.billed_card_last_four, billed_card_type: @cart.billed_card_type, billed_city: @cart.billed_city, billed_method: @cart.billed_method, billed_province: @cart.billed_province, billed_room: @cart.billed_room, billed_street: @cart.billed_street, currency_at_checkout: @cart.currency_at_checkout, order_submitted_at: @cart.order_submitted_at, payment_settled_at: @cart.payment_settled_at, service_fee: @cart.service_fee, shipped_city: @cart.shipped_city, shipped_directions: @cart.shipped_directions, shipped_primary_phone: @cart.shipped_primary_phone, shipped_province: @cart.shipped_province, shipped_room: @cart.shipped_room, shipped_secondary_phone: @cart.shipped_secondary_phone, shipped_street: @cart.shipped_street, shipping_fee: @cart.shipping_fee, shop_acknowledged_at: @cart.shop_acknowledged_at, shop_name_at_checkout: @cart.shop_name_at_checkout, shop_notified_at: @cart.shop_notified_at, special_instructins: @cart.special_instructins, tax: @cart.tax }
    end

    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should show cart" do
    get :show, id: @cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cart
    assert_response :success
  end

  test "should update cart" do
    put :update, id: @cart, cart: { billed_card_expiration: @cart.billed_card_expiration, billed_card_last_four: @cart.billed_card_last_four, billed_card_type: @cart.billed_card_type, billed_city: @cart.billed_city, billed_method: @cart.billed_method, billed_province: @cart.billed_province, billed_room: @cart.billed_room, billed_street: @cart.billed_street, currency_at_checkout: @cart.currency_at_checkout, order_submitted_at: @cart.order_submitted_at, payment_settled_at: @cart.payment_settled_at, service_fee: @cart.service_fee, shipped_city: @cart.shipped_city, shipped_directions: @cart.shipped_directions, shipped_primary_phone: @cart.shipped_primary_phone, shipped_province: @cart.shipped_province, shipped_room: @cart.shipped_room, shipped_secondary_phone: @cart.shipped_secondary_phone, shipped_street: @cart.shipped_street, shipping_fee: @cart.shipping_fee, shop_acknowledged_at: @cart.shop_acknowledged_at, shop_name_at_checkout: @cart.shop_name_at_checkout, shop_notified_at: @cart.shop_notified_at, special_instructins: @cart.special_instructins, tax: @cart.tax }
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      delete :destroy, id: @cart
    end

    assert_redirected_to carts_path
  end
end
