require "application_system_test_case"

class MaintenancesTest < ApplicationSystemTestCase
  setup do
    @maintenance = maintenances(:one)
  end

  test "visiting the index" do
    visit maintenances_url
    assert_selector "h1", text: "Maintenances"
  end

  test "creating a Maintenance" do
    visit maintenances_url
    click_on "New Maintenance"

    fill_in "Car", with: @maintenance.car_id
    fill_in "Completed mirage", with: @maintenance.completed_mirage
    fill_in "Completed on", with: @maintenance.completed_on
    fill_in "Title", with: @maintenance.title
    click_on "Create Maintenance"

    assert_text "Maintenance was successfully created"
    click_on "Back"
  end

  test "updating a Maintenance" do
    visit maintenances_url
    click_on "Edit", match: :first

    fill_in "Car", with: @maintenance.car_id
    fill_in "Completed mirage", with: @maintenance.completed_mirage
    fill_in "Completed on", with: @maintenance.completed_on
    fill_in "Title", with: @maintenance.title
    click_on "Update Maintenance"

    assert_text "Maintenance was successfully updated"
    click_on "Back"
  end

  test "destroying a Maintenance" do
    visit maintenances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maintenance was successfully destroyed"
  end
end
