require 'test_helper'

class OculistesControllerTest < ActionController::TestCase
  setup do
    @oculiste = oculistes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oculistes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oculiste" do
    assert_difference('Oculiste.count') do
      post :create, oculiste: { note: @oculiste.note, rdv: @oculiste.rdv }
    end

    assert_redirected_to oculiste_path(assigns(:oculiste))
  end

  test "should show oculiste" do
    get :show, id: @oculiste
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oculiste
    assert_response :success
  end

  test "should update oculiste" do
    patch :update, id: @oculiste, oculiste: { note: @oculiste.note, rdv: @oculiste.rdv }
    assert_redirected_to oculiste_path(assigns(:oculiste))
  end

  test "should destroy oculiste" do
    assert_difference('Oculiste.count', -1) do
      delete :destroy, id: @oculiste
    end

    assert_redirected_to oculistes_path
  end
end
