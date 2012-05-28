require 'test_helper'

class LunchToDinnersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lunch_to_dinners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lunch_to_dinner" do
    assert_difference('LunchToDinner.count') do
      post :create, :lunch_to_dinner => { }
    end

    assert_redirected_to lunch_to_dinner_path(assigns(:lunch_to_dinner))
  end

  test "should show lunch_to_dinner" do
    get :show, :id => lunch_to_dinners(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lunch_to_dinners(:one).to_param
    assert_response :success
  end

  test "should update lunch_to_dinner" do
    put :update, :id => lunch_to_dinners(:one).to_param, :lunch_to_dinner => { }
    assert_redirected_to lunch_to_dinner_path(assigns(:lunch_to_dinner))
  end

  test "should destroy lunch_to_dinner" do
    assert_difference('LunchToDinner.count', -1) do
      delete :destroy, :id => lunch_to_dinners(:one).to_param
    end

    assert_redirected_to lunch_to_dinners_path
  end
end
