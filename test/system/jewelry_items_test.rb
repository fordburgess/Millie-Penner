require "application_system_test_case"

class JewelryItemsTest < ApplicationSystemTestCase
  setup do
    @jewelry_item = jewelry_items(:one)
  end

  test "visiting the index" do
    visit jewelry_items_url
    assert_selector "h1", text: "Jewelry items"
  end

  test "should create jewelry item" do
    visit jewelry_items_url
    click_on "New jewelry item"

    fill_in "Description", with: @jewelry_item.description
    fill_in "Materials", with: @jewelry_item.materials
    fill_in "Price", with: @jewelry_item.price
    fill_in "Title", with: @jewelry_item.title
    click_on "Create Jewelry item"

    assert_text "Jewelry item was successfully created"
    click_on "Back"
  end

  test "should update Jewelry item" do
    visit jewelry_item_url(@jewelry_item)
    click_on "Edit this jewelry item", match: :first

    fill_in "Description", with: @jewelry_item.description
    fill_in "Materials", with: @jewelry_item.materials
    fill_in "Price", with: @jewelry_item.price
    fill_in "Title", with: @jewelry_item.title
    click_on "Update Jewelry item"

    assert_text "Jewelry item was successfully updated"
    click_on "Back"
  end

  test "should destroy Jewelry item" do
    visit jewelry_item_url(@jewelry_item)
    click_on "Destroy this jewelry item", match: :first

    assert_text "Jewelry item was successfully destroyed"
  end
end
