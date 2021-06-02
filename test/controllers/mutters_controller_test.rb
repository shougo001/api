require "test_helper"

class MuttersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mutter = mutters(:one)
  end

  test "should get index" do
    get mutters_url
    assert_response :success
  end

  test "should get new" do
    get new_mutter_url
    assert_response :success
  end

  test "should create mutter" do
    assert_difference('Mutter.count') do
      post mutters_url, params: { mutter: { message: @mutter.message, name: @mutter.name } }
    end

    assert_redirected_to mutter_url(Mutter.last)
  end

  test "should show mutter" do
    get mutter_url(@mutter)
    assert_response :success
  end

  test "should get edit" do
    get edit_mutter_url(@mutter)
    assert_response :success
  end

  test "should update mutter" do
    patch mutter_url(@mutter), params: { mutter: { message: @mutter.message, name: @mutter.name } }
    assert_redirected_to mutter_url(@mutter)
  end

  test "should destroy mutter" do
    assert_difference('Mutter.count', -1) do
      delete mutter_url(@mutter)
    end

    assert_redirected_to mutters_url
  end
end
