class ReviewsController < ApplicationController
  before_action :set_review, only: [:update, :destroy]
  before_action :require_login, only: [:create]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    @review = Review.where("movie_id = ?", params[:id])
    # binding.pry
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    
    
    if @review.save
      
      render json: @review, status: :created, location: @review
    else
      render json: {error: "Unable to create review"}, status: :unprocessable_entity
    end
    # binding.pry
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:id, :title, :content, :movie_id, :user_id)
    end
end
