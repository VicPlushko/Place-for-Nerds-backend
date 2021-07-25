class ReviewsController < ApplicationController
  before_action :set_review, only: [:update, :destroy]

  def index
    @reviews = Review.all

    render json: @reviews
  end

  def show
    @review = Review.where("movie_id = ?", params[:id])
    render json: @review
  end

  def create
    @review = Review.new(review_params)
    
    
    if @review.save
      
      render json: @review, status: :created, location: @review
    else
      render json: {error: "Unable to create review"}, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
  end

  private
    
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:id, :title, :content, :movie_id, :user_id)
    end
end
