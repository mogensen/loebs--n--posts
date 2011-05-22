require 'test_helper'

class LoebsControllerTest < ActionController::TestCase
  setup do
    @loeb = loebs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loebs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loeb" do
    assert_difference('Loeb.count') do
      post :create, :loeb => @loeb.attributes
    end

    assert_redirected_to loeb_path(assigns(:loeb))
  end

  test "should show loeb" do
    get :show, :id => @loeb.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @loeb.to_param
    assert_response :success
  end

  test "should update loeb" do
    put :update, :id => @loeb.to_param, :loeb => @loeb.attributes
    assert_redirected_to loeb_path(assigns(:loeb))
  end

  test "should destroy loeb" do
    assert_difference('Loeb.count', -1) do
      delete :destroy, :id => @loeb.to_param
    end

    assert_redirected_to loebs_path
  end
end
