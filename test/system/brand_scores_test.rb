require "application_system_test_case"

class BrandScoresTest < ApplicationSystemTestCase
  setup do
    @brand_score = brand_scores(:one)
  end

  test "visiting the index" do
    visit brand_scores_url
    assert_selector "h1", text: "Brand Scores"
  end

  test "creating a Brand score" do
    visit brand_scores_url
    click_on "New Brand Score"

    fill_in "Score", with: @brand_score.score
    fill_in "Term", with: @brand_score.term
    click_on "Create Brand score"

    assert_text "Brand score was successfully created"
    click_on "Back"
  end

  test "updating a Brand score" do
    visit brand_scores_url
    click_on "Edit", match: :first

    fill_in "Score", with: @brand_score.score
    fill_in "Term", with: @brand_score.term
    click_on "Update Brand score"

    assert_text "Brand score was successfully updated"
    click_on "Back"
  end

  test "destroying a Brand score" do
    visit brand_scores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brand score was successfully destroyed"
  end
end
