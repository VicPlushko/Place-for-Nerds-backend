class TvShowReviewsController < ApplicationController
  before_action :set_tv_show_review, only: [:show, :update, :destroy]

  # GET /tv_show_reviews
  def index
    @tv_show_reviews = TvShowReview.all

    render json: @tv_show_reviews
  end

  # GET /tv_show_reviews/1
  def show
    @tv_show_review = TvShowReview.where("show_id = ?", params[:id])
    render json: @tv_show_review
  end

  # POST /tv_show_reviews
  def create
    @tv_show_review = TvShowReview.new(tv_show_review_params)

    if @tv_show_review.save
      render json: @tv_show_review, status: :created, location: @tv_show_review
    else
      render json: @tv_show_review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tv_show_reviews/1
  def update
    if @tv_show_review.update(tv_show_review_params)
      render json: @tv_show_review
    else
      render json: @tv_show_review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tv_show_reviews/1
  def destroy
    @tv_show_review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tv_show_review
      @tv_show_review = TvShowReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tv_show_review_params
      params.require(:tv_show_review).permit(:title, :content, :show_id, :user_id)
    end
end
