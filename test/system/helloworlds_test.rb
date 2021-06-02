require "application_system_test_case"

class HelloworldsTest < ApplicationSystemTestCase
  setup do
    @helloworld = helloworlds(:one)
  end

  test "visiting the index" do
    visit helloworlds_url
    assert_selector "h1", text: "Helloworlds"
  end

  test "creating a Helloworld" do
    visit helloworlds_url
    click_on "New Helloworld"

    fill_in "Content", with: @helloworld.content
    fill_in "Name", with: @helloworld.name
    click_on "Create Helloworld"

    assert_text "Helloworld was successfully created"
    click_on "Back"
  end

  test "updating a Helloworld" do
    visit helloworlds_url
    click_on "Edit", match: :first

    fill_in "Content", with: @helloworld.content
    fill_in "Name", with: @helloworld.name
    click_on "Update Helloworld"

    assert_text "Helloworld was successfully updated"
    click_on "Back"
  end

  test "destroying a Helloworld" do
    visit helloworlds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Helloworld was successfully destroyed"
  end
end
