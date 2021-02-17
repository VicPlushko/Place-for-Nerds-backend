class MoviesController < ApplicationController
  before_action :set_movie, only: [:update, :destroy]

  def index
    # binding.pry
    @movies = Movie.all
    render json: @movies, except: [:created_at, :updated_at]
  end

  def show
    @movie = Movie.find_by(movie_id: params[:id])
    render json: @movie 
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
  end

  def search
    @movie = Movie.where("title LIKE ?", "%" + params[:searchterm] + "%")

    render json: @movie
  end

  private
  
    def set_movie
      @movie = Movie.find(params[:id])
    end

    
    def movie_params
      params.require(:movie).permit(:title, :release_date, :synopsis, :poster, :actor_id, :genre, :movie_id)
    end
end
