require 'test_helper'

class CarbsControllerTest < ActionController::TestCase
  setup do
    @carb = carbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carb" do
    assert_difference('Carb.count') do
      post :create, carb: { date: @carb.date, note: @carb.note, valeur: @carb.valeur }
    end

    assert_redirected_to carb_path(assigns(:carb))
  end

  test "should show carb" do
    get :show, id: @carb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carb
    assert_response :success
  end

  test "should update carb" do
    patch :update, id: @carb, carb: { date: @carb.date, note: @carb.note, valeur: @carb.valeur }
    assert_redirected_to carb_path(assigns(:carb))
  end

  test "should destroy carb" do
    assert_difference('Carb.count', -1) do
      delete :destroy, id: @carb
    end

    assert_redirected_to carbs_path
  end
end
