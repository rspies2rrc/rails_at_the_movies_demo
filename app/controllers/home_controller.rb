class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:production_company).order("avg_vote DESC").limit(10)

    @production_companies = ProductionCompany.all.limit(10)
  end
end
