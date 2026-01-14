require "test_helper"

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_index_url
    assert_response :success
  end

  test "should get show" do
    get new_show_url
    assert_response :success
  end

  test "should get update" do
    get new_update_url
    assert_response :success
  end

  test "should get edit" do
    get new_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get new_destroy_url
    assert_response :success
  end
end
