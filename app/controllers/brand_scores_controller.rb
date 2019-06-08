class BrandScoresController < ApplicationController
  before_action :set_brand_score, only: [:show, :edit, :update, :destroy]

  # GET /brand_scores
  # GET /brand_scores.json
  def index
    @brand_scores = BrandScore.all
  end

  # GET /brand_scores/1
  # GET /brand_scores/1.json
  def show
  end

  # GET /brand_scores/new
  def new
    @brand_score = BrandScore.new
  end

  # GET /brand_scores/1/edit
  def edit
  end

  # POST /brand_scores
  # POST /brand_scores.json
  def create
    @brand_score = BrandScore.new(brand_score_params)

    twitter = TwitterService.new
    @brand_score.score = twitter.search_and_rate_sentiment(@brand_score.term)

    respond_to do |format|
      if @brand_score.save
        format.html { redirect_to @brand_score, notice: 'Brand score was successfully created.' }
        format.json { render :show, status: :created, location: @brand_score }
      else
        format.html { render :new }
        format.json { render json: @brand_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brand_scores/1
  # PATCH/PUT /brand_scores/1.json
  def update
    respond_to do |format|
      if @brand_score.update(brand_score_params)
        format.html { redirect_to @brand_score, notice: 'Brand score was successfully updated.' }
        format.json { render :show, status: :ok, location: @brand_score }
      else
        format.html { render :edit }
        format.json { render json: @brand_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brand_scores/1
  # DELETE /brand_scores/1.json
  def destroy
    @brand_score.destroy
    respond_to do |format|
      format.html { redirect_to brand_scores_url, notice: 'Brand score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand_score
      @brand_score = BrandScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_score_params
      params.require(:brand_score).permit(:term, :score)
    end
end
