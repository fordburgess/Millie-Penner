require "test_helper"

class ZinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zine = zines(:one)
  end

  test "should get index" do
    get zines_url
    assert_response :success
  end

  test "should get new" do
    get new_zine_url
    assert_response :success
  end

  test "should create zine" do
    assert_difference("Zine.count") do
      post zines_url, params: { zine: { description: @zine.description, pages: @zine.pages, price: @zine.price, size: @zine.size, title: @zine.title } }
    end

    assert_redirected_to zine_url(Zine.last)
  end

  test "should show zine" do
    get zine_url(@zine)
    assert_response :success
  end

  test "should get edit" do
    get edit_zine_url(@zine)
    assert_response :success
  end

  test "should update zine" do
    patch zine_url(@zine), params: { zine: { description: @zine.description, pages: @zine.pages, price: @zine.price, size: @zine.size, title: @zine.title } }
    assert_redirected_to zine_url(@zine)
  end

  test "should destroy zine" do
    assert_difference("Zine.count", -1) do
      delete zine_url(@zine)
    end

    assert_redirected_to zines_url
  end
end
