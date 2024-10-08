class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:production_company).order("avg_vote DESC").limit(10)

    @production_companies = ProductionCompany.select("production_companies.*")
                                             .select("COUNT(production_company_id) as movie_count")
                                             .left_outer_joins(:movies)
                                             .group("production_company_id")
                                             .order("movie_count DESC")
                                             .limit(10)
  end
end
