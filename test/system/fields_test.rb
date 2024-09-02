require "application_system_test_case"

class FieldsTest < ApplicationSystemTestCase
  setup do
    @field = fields(:one)
  end

  test "visiting the index" do
    visit fields_url
    assert_selector "h1", text: "Fields"
  end

  test "should create field" do
    visit fields_url
    click_on "New field"

    fill_in "Current crop", with: @field.current_crop
    check "Fertilizer" if @field.fertilizer
    fill_in "Fertilizer type", with: @field.fertilizer_type
    fill_in "Fertilizer usage", with: @field.fertilizer_usage
    fill_in "Harvest date", with: @field.harvest_date
    check "Leased" if @field.leased
    fill_in "Leasing end date", with: @field.leasing_end_date
    fill_in "Location latitude", with: @field.location_latitude
    fill_in "Location longitude", with: @field.location_longitude
    fill_in "Location name", with: @field.location_name
    fill_in "Name", with: @field.name
    fill_in "Size", with: @field.size
    fill_in "Sowing date", with: @field.sowing_date
    click_on "Create Field"

    assert_text "Field was successfully created"
    click_on "Back"
  end

  test "should update Field" do
    visit field_url(@field)
    click_on "Edit this field", match: :first

    fill_in "Current crop", with: @field.current_crop
    check "Fertilizer" if @field.fertilizer
    fill_in "Fertilizer type", with: @field.fertilizer_type
    fill_in "Fertilizer usage", with: @field.fertilizer_usage
    fill_in "Harvest date", with: @field.harvest_date
    check "Leased" if @field.leased
    fill_in "Leasing end date", with: @field.leasing_end_date
    fill_in "Location latitude", with: @field.location_latitude
    fill_in "Location longitude", with: @field.location_longitude
    fill_in "Location name", with: @field.location_name
    fill_in "Name", with: @field.name
    fill_in "Size", with: @field.size
    fill_in "Sowing date", with: @field.sowing_date
    click_on "Update Field"

    assert_text "Field was successfully updated"
    click_on "Back"
  end

  test "should destroy Field" do
    visit field_url(@field)
    click_on "Destroy this field", match: :first

    assert_text "Field was successfully destroyed"
  end
end
