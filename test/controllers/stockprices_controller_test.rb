require 'test_helper'

class StockpricesControllerTest < ActionController::TestCase
  setup do
    @stockprice = stockprices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stockprices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stockprice" do
    assert_difference('Stockprice.count') do
      post :create, stockprice: {  }
    end

    assert_redirected_to stockprice_path(assigns(:stockprice))
  end

  test "should show stockprice" do
    get :show, id: @stockprice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stockprice
    assert_response :success
  end

  test "should update stockprice" do
    patch :update, id: @stockprice, stockprice: {  }
    assert_redirected_to stockprice_path(assigns(:stockprice))
  end

  test "should destroy stockprice" do
    assert_difference('Stockprice.count', -1) do
      delete :destroy, id: @stockprice
    end

    assert_redirected_to stockprices_path
  end
end
