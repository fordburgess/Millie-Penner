require "application_system_test_case"

class ZinesTest < ApplicationSystemTestCase
  setup do
    @zine = zines(:one)
  end

  test "visiting the index" do
    visit zines_url
    assert_selector "h1", text: "Zines"
  end

  test "should create zine" do
    visit zines_url
    click_on "New zine"

    fill_in "Description", with: @zine.description
    fill_in "Pages", with: @zine.pages
    fill_in "Price", with: @zine.price
    fill_in "Size", with: @zine.size
    fill_in "Title", with: @zine.title
    click_on "Create Zine"

    assert_text "Zine was successfully created"
    click_on "Back"
  end

  test "should update Zine" do
    visit zine_url(@zine)
    click_on "Edit this zine", match: :first

    fill_in "Description", with: @zine.description
    fill_in "Pages", with: @zine.pages
    fill_in "Price", with: @zine.price
    fill_in "Size", with: @zine.size
    fill_in "Title", with: @zine.title
    click_on "Update Zine"

    assert_text "Zine was successfully updated"
    click_on "Back"
  end

  test "should destroy Zine" do
    visit zine_url(@zine)
    click_on "Destroy this zine", match: :first

    assert_text "Zine was successfully destroyed"
  end
end
