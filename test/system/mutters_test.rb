require "application_system_test_case"

class MuttersTest < ApplicationSystemTestCase
  setup do
    @mutter = mutters(:one)
  end

  test "visiting the index" do
    visit mutters_url
    assert_selector "h1", text: "Mutters"
  end

  test "creating a Mutter" do
    visit mutters_url
    click_on "New Mutter"

    fill_in "Message", with: @mutter.message
    fill_in "Name", with: @mutter.name
    click_on "Create Mutter"

    assert_text "Mutter was successfully created"
    click_on "Back"
  end

  test "updating a Mutter" do
    visit mutters_url
    click_on "Edit", match: :first

    fill_in "Message", with: @mutter.message
    fill_in "Name", with: @mutter.name
    click_on "Update Mutter"

    assert_text "Mutter was successfully updated"
    click_on "Back"
  end

  test "destroying a Mutter" do
    visit mutters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mutter was successfully destroyed"
  end
end
