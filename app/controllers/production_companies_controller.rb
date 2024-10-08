class ProductionCompaniesController < ApplicationController
  def index
    @production_companies = ProductionCompany.order_by_movies
  end

  def show
    @production_company = ProductionCompany.find(params[:id])
  end
end
