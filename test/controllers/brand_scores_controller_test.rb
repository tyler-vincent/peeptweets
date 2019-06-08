require 'test_helper'

class BrandScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brand_score = brand_scores(:one)
  end

  test "should get index" do
    get brand_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_brand_score_url
    assert_response :success
  end

  test "should create brand_score" do
    assert_difference('BrandScore.count') do
      post brand_scores_url, params: { brand_score: { score: @brand_score.score, term: @brand_score.term } }
    end

    assert_redirected_to brand_score_url(BrandScore.last)
  end

  test "should show brand_score" do
    get brand_score_url(@brand_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_brand_score_url(@brand_score)
    assert_response :success
  end

  test "should update brand_score" do
    patch brand_score_url(@brand_score), params: { brand_score: { score: @brand_score.score, term: @brand_score.term } }
    assert_redirected_to brand_score_url(@brand_score)
  end

  test "should destroy brand_score" do
    assert_difference('BrandScore.count', -1) do
      delete brand_score_url(@brand_score)
    end

    assert_redirected_to brand_scores_url
  end
end
