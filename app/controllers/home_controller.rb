class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:production_company).order("avg_vote DESC").limit(10)

    @production_companies = ProductionCompany.order_by_movies.limit(10)
  end
end
