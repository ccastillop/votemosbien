require "application_system_test_case"

class CandidatesTest < ApplicationSystemTestCase
  setup do
    @candidate = candidates(:one)
  end

  test "visiting the index" do
    visit candidates_url
    assert_selector "h1", text: "Candidates"
  end

  test "creating a Candidate" do
    visit candidates_url
    click_on "New Candidate"

    fill_in "Dni", with: @candidate.dni
    fill_in "Election", with: @candidate.election_id
    fill_in "Father surname", with: @candidate.father_surname
    fill_in "Mother surname", with: @candidate.mother_surname
    fill_in "Names", with: @candidate.names
    fill_in "Number", with: @candidate.number
    fill_in "Party", with: @candidate.party_id
    fill_in "Region", with: @candidate.region_id
    fill_in "Status", with: @candidate.status
    click_on "Create Candidate"

    assert_text "Candidate was successfully created"
    click_on "Back"
  end

  test "updating a Candidate" do
    visit candidates_url
    click_on "Edit", match: :first

    fill_in "Dni", with: @candidate.dni
    fill_in "Election", with: @candidate.election_id
    fill_in "Father surname", with: @candidate.father_surname
    fill_in "Mother surname", with: @candidate.mother_surname
    fill_in "Names", with: @candidate.names
    fill_in "Number", with: @candidate.number
    fill_in "Party", with: @candidate.party_id
    fill_in "Region", with: @candidate.region_id
    fill_in "Status", with: @candidate.status
    click_on "Update Candidate"

    assert_text "Candidate was successfully updated"
    click_on "Back"
  end

  test "destroying a Candidate" do
    visit candidates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Candidate was successfully destroyed"
  end
end
