require "test_helper"

class JewelryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jewelry_item = jewelry_items(:one)
  end

  test "should get index" do
    get jewelry_items_url
    assert_response :success
  end

  test "should get new" do
    get new_jewelry_item_url
    assert_response :success
  end

  test "should create jewelry_item" do
    assert_difference("JewelryItem.count") do
      post jewelry_items_url, params: { jewelry_item: { description: @jewelry_item.description, materials: @jewelry_item.materials, price: @jewelry_item.price, title: @jewelry_item.title } }
    end

    assert_redirected_to jewelry_item_url(JewelryItem.last)
  end

  test "should show jewelry_item" do
    get jewelry_item_url(@jewelry_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_jewelry_item_url(@jewelry_item)
    assert_response :success
  end

  test "should update jewelry_item" do
    patch jewelry_item_url(@jewelry_item), params: { jewelry_item: { description: @jewelry_item.description, materials: @jewelry_item.materials, price: @jewelry_item.price, title: @jewelry_item.title } }
    assert_redirected_to jewelry_item_url(@jewelry_item)
  end

  test "should destroy jewelry_item" do
    assert_difference("JewelryItem.count", -1) do
      delete jewelry_item_url(@jewelry_item)
    end

    assert_redirected_to jewelry_items_url
  end
end
