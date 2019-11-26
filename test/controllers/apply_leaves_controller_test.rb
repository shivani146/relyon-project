require 'test_helper'

class ApplyLeavesControllerTest < ActionController::TestCase
  setup do
    @apply_leafe = apply_leaves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apply_leaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apply_leafe" do
    assert_difference('ApplyLeafe.count') do
      post :create, apply_leafe: {  }
    end

    assert_redirected_to apply_leafe_path(assigns(:apply_leafe))
  end

  test "should show apply_leafe" do
    get :show, id: @apply_leafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apply_leafe
    assert_response :success
  end

  test "should update apply_leafe" do
    patch :update, id: @apply_leafe, apply_leafe: {  }
    assert_redirected_to apply_leafe_path(assigns(:apply_leafe))
  end

  test "should destroy apply_leafe" do
    assert_difference('ApplyLeafe.count', -1) do
      delete :destroy, id: @apply_leafe
    end

    assert_redirected_to apply_leaves_path
  end
end
