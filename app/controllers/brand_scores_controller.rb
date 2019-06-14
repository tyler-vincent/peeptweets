class BrandScoresController < ApplicationController

  # GET /brand_scores.json
  def index
    @brand_scores = BrandScore.all
  end

  # POST /brand_scores.json
  def create
    @brand_score = BrandScore.new(brand_score_params)

    twitter = TwitterService.new
    @brand_score.score = twitter.search_and_rate_sentiment(@brand_score.term)

    respond_to do |format|
      if @brand_score.save
        format.json { render :show, status: :created, location: @brand_score }
      else
        format.json { render json: @brand_score.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_score_params
      params.require(:brand_score).permit(:term, :score)
    end
end
