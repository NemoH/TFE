require 'test_helper'

class InsulinesControllerTest < ActionController::TestCase
  setup do
    @insuline = insulines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insulines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insuline" do
    assert_difference('Insuline.count') do
      post :create, insuline: { date: @insuline.date, name: @insuline.name, note: @insuline.note, unit: @insuline.unit }
    end

    assert_redirected_to insuline_path(assigns(:insuline))
  end

  test "should show insuline" do
    get :show, id: @insuline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insuline
    assert_response :success
  end

  test "should update insuline" do
    patch :update, id: @insuline, insuline: { date: @insuline.date, name: @insuline.name, note: @insuline.note, unit: @insuline.unit }
    assert_redirected_to insuline_path(assigns(:insuline))
  end

  test "should destroy insuline" do
    assert_difference('Insuline.count', -1) do
      delete :destroy, id: @insuline
    end

    assert_redirected_to insulines_path
  end
end
