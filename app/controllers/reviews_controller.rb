class ReviewsController < ApplicationController
  before_action :has_moviegoer_and_movie, :only => [:new, :create]
  protected
  def has_moviegoer_and_movie
    unless @current_user
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to login_path
    end

    unless (@movie = Movie.find_by(id: params[:movie_id]))
      flash[:warning] = 'Review must be fore an existing movie.'
      redirect_to movies_path
    end
  end

  public
  def new
    @review = @movie.reviews.build
  end

  def create
    # byebug
    @current_user.reviews << @movie.reviews.build(review_params)
    redirect_to movie_path(@movie)
  end

  private
  def review_params
    params.require(:review).permit(:potatoes, :comments, :movie_id, :moviegoer_id)
  end

end
