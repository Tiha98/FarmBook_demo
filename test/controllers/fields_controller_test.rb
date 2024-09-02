require "test_helper"

class FieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @field = fields(:one)
  end

  test "should get index" do
    get fields_url
    assert_response :success
  end

  test "should get new" do
    get new_field_url
    assert_response :success
  end

  test "should create field" do
    assert_difference("Field.count") do
      post fields_url, params: { field: { current_crop: @field.current_crop, fertilizer: @field.fertilizer, fertilizer_type: @field.fertilizer_type, fertilizer_usage: @field.fertilizer_usage, harvest_date: @field.harvest_date, leased: @field.leased, leasing_end_date: @field.leasing_end_date, location_latitude: @field.location_latitude, location_longitude: @field.location_longitude, location_name: @field.location_name, name: @field.name, size: @field.size, sowing_date: @field.sowing_date } }
    end

    assert_redirected_to field_url(Field.last)
  end

  test "should show field" do
    get field_url(@field)
    assert_response :success
  end

  test "should get edit" do
    get edit_field_url(@field)
    assert_response :success
  end

  test "should update field" do
    patch field_url(@field), params: { field: { current_crop: @field.current_crop, fertilizer: @field.fertilizer, fertilizer_type: @field.fertilizer_type, fertilizer_usage: @field.fertilizer_usage, harvest_date: @field.harvest_date, leased: @field.leased, leasing_end_date: @field.leasing_end_date, location_latitude: @field.location_latitude, location_longitude: @field.location_longitude, location_name: @field.location_name, name: @field.name, size: @field.size, sowing_date: @field.sowing_date } }
    assert_redirected_to field_url(@field)
  end

  test "should destroy field" do
    assert_difference("Field.count", -1) do
      delete field_url(@field)
    end

    assert_redirected_to fields_url
  end
end
