require 'test_helper'

class PrisedesangsControllerTest < ActionController::TestCase
  setup do
    @prisedesang = prisedesangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prisedesangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prisedesang" do
    assert_difference('Prisedesang.count') do
      post :create, prisedesang: { note: @prisedesang.note, rdv: @prisedesang.rdv }
    end

    assert_redirected_to prisedesang_path(assigns(:prisedesang))
  end

  test "should show prisedesang" do
    get :show, id: @prisedesang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prisedesang
    assert_response :success
  end

  test "should update prisedesang" do
    patch :update, id: @prisedesang, prisedesang: { note: @prisedesang.note, rdv: @prisedesang.rdv }
    assert_redirected_to prisedesang_path(assigns(:prisedesang))
  end

  test "should destroy prisedesang" do
    assert_difference('Prisedesang.count', -1) do
      delete :destroy, id: @prisedesang
    end

    assert_redirected_to prisedesangs_path
  end
end
