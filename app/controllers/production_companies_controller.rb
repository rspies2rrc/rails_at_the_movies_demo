class ProductionCompaniesController < ApplicationController
  def index
    @production_companies = ProductionCompany.select("production_companies.*")
                                             .select("COUNT(production_company_id) as movie_count")
                                             .left_outer_joins(:movies)
                                             .group("production_company_id")
                                             .order("movie_count DESC")
  end

  def show
    @production_company = ProductionCompany.find(params[:id])
  end
end
