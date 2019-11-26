require 'test_helper'

class SalaryHeadsControllerTest < ActionController::TestCase
  setup do
    @salary_head = salary_heads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_heads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_head" do
    assert_difference('SalaryHead.count') do
      post :create, salary_head: {  }
    end

    assert_redirected_to salary_head_path(assigns(:salary_head))
  end

  test "should show salary_head" do
    get :show, id: @salary_head
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_head
    assert_response :success
  end

  test "should update salary_head" do
    patch :update, id: @salary_head, salary_head: {  }
    assert_redirected_to salary_head_path(assigns(:salary_head))
  end

  test "should destroy salary_head" do
    assert_difference('SalaryHead.count', -1) do
      delete :destroy, id: @salary_head
    end

    assert_redirected_to salary_heads_path
  end
end
