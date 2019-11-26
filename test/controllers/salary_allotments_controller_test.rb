require 'test_helper'

class SalaryAllotmentsControllerTest < ActionController::TestCase
  setup do
    @salary_allotment = salary_allotments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_allotments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_allotment" do
    assert_difference('SalaryAllotment.count') do
      post :create, salary_allotment: {  }
    end

    assert_redirected_to salary_allotment_path(assigns(:salary_allotment))
  end

  test "should show salary_allotment" do
    get :show, id: @salary_allotment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_allotment
    assert_response :success
  end

  test "should update salary_allotment" do
    patch :update, id: @salary_allotment, salary_allotment: {  }
    assert_redirected_to salary_allotment_path(assigns(:salary_allotment))
  end

  test "should destroy salary_allotment" do
    assert_difference('SalaryAllotment.count', -1) do
      delete :destroy, id: @salary_allotment
    end

    assert_redirected_to salary_allotments_path
  end
end
