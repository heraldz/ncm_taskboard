require 'test_helper'

class ProductOwnersControllerTest < ActionController::TestCase
  setup do
    @product_owner = product_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_owner" do
    assert_difference('ProductOwner.count') do
      post :create, product_owner: { name: @product_owner.name }
    end

    assert_redirected_to product_owner_path(assigns(:product_owner))
  end

  test "should show product_owner" do
    get :show, id: @product_owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_owner
    assert_response :success
  end

  test "should update product_owner" do
    put :update, id: @product_owner, product_owner: { name: @product_owner.name }
    assert_redirected_to product_owner_path(assigns(:product_owner))
  end

  test "should destroy product_owner" do
    assert_difference('ProductOwner.count', -1) do
      delete :destroy, id: @product_owner
    end

    assert_redirected_to product_owners_path
  end
end
