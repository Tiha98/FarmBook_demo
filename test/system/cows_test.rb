require "application_system_test_case"

class CowsTest < ApplicationSystemTestCase
  setup do
    @cow = cows(:one)
  end

  test "visiting the index" do
    visit cows_url
    assert_selector "h1", text: "Cows"
  end

  test "should create cow" do
    visit cows_url
    click_on "New cow"

    fill_in "Approxcalving", with: @cow.approxcalving
    fill_in "Breed", with: @cow.breed
    fill_in "Fathersementype", with: @cow.fathersementype
    fill_in "Identificationnumber", with: @cow.identificationnumber
    fill_in "Lactationstatus", with: @cow.lactationstatus
    fill_in "Lastcalvingdate", with: @cow.lastcalvingdate
    check "Pregnancystatus" if @cow.pregnancystatus
    click_on "Create Cow"

    assert_text "Cow was successfully created"
    click_on "Back"
  end

  test "should update Cow" do
    visit cow_url(@cow)
    click_on "Edit this cow", match: :first

    fill_in "Approxcalving", with: @cow.approxcalving
    fill_in "Breed", with: @cow.breed
    fill_in "Fathersementype", with: @cow.fathersementype
    fill_in "Identificationnumber", with: @cow.identificationnumber
    fill_in "Lactationstatus", with: @cow.lactationstatus
    fill_in "Lastcalvingdate", with: @cow.lastcalvingdate
    check "Pregnancystatus" if @cow.pregnancystatus
    click_on "Update Cow"

    assert_text "Cow was successfully updated"
    click_on "Back"
  end

  test "should destroy Cow" do
    visit cow_url(@cow)
    click_on "Destroy this cow", match: :first

    assert_text "Cow was successfully destroyed"
  end
end
