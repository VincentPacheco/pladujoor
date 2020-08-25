require 'test_helper'

class DishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dishes_index_url
    assert_response :success
  end

  test "should get show" do
    get dishes_show_url
    assert_response :success
  end

  test "should get new" do
    get dishes_new_url
    assert_response :success
  end

  test "should get create" do
    get dishes_create_url
    assert_response :success
  end

  test "should get update" do
    get dishes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dishes_destroy_url
    assert_response :success
  end

end
