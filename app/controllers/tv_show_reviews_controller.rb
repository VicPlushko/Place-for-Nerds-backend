class TvShowReviewsController < ApplicationController
  before_action :set_tv_show_review, only: [:update, :destroy]

  def index
    @tv_show_reviews = TvShowReview.all

    render json: @tv_show_reviews
  end

  def show
    @tv_show_review = TvShowReview.where("show_id = ?", params[:id])
    render json: @tv_show_review
  end

  def create
    @tv_show_review = TvShowReview.new(tv_show_review_params)

    if @tv_show_review.save
      render json: @tv_show_review, status: :created, location: @tv_show_review
    else
      render json: @tv_show_review.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tv_show_review.update(tv_show_review_params)
      render json: @tv_show_review
    else
      render json: @tv_show_review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tv_show_review.destroy
  end

  private
    
    def set_tv_show_review
      @tv_show_review = TvShowReview.find(params[:id])
    end

    
    def tv_show_review_params
      params.require(:tv_show_review).permit(:id, :title, :content, :show_id, :user_id)
    end
end
