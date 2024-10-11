class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:production_company).order("avg_vote DESC")
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    wild_card_search = "%#{params[:keywords]}%"
    @movies = Movie.where("title LIKE ?", wild_card_search)
  end
end
