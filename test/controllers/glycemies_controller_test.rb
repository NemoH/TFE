require 'test_helper'

class GlycemiesControllerTest < ActionController::TestCase
  setup do
    @glycemy = glycemies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glycemies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glycemy" do
    assert_difference('Glycemy.count') do
      post :create, glycemy: { date: @glycemy.date, note: @glycemy.note, users_id: @glycemy.users_id, valeur: @glycemy.valeur }
    end

    assert_redirected_to glycemy_path(assigns(:glycemy))
  end

  test "should show glycemy" do
    get :show, id: @glycemy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @glycemy
    assert_response :success
  end

  test "should update glycemy" do
    patch :update, id: @glycemy, glycemy: { date: @glycemy.date, note: @glycemy.note, users_id: @glycemy.users_id, valeur: @glycemy.valeur }
    assert_redirected_to glycemy_path(assigns(:glycemy))
  end

  test "should destroy glycemy" do
    assert_difference('Glycemy.count', -1) do
      delete :destroy, id: @glycemy
    end

    assert_redirected_to glycemies_path
  end
end
