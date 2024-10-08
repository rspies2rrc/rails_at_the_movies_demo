class ProductionCompany < ApplicationRecord
  has_many :movies
  validates :name, uniqueness: true

  def order_by_movies
    self.select("production_companies.*")
        .select("COUNT(production_company_id) as movie_count")
        .left_outer_joins(:movies)
        .group("production_company_id")
        .order("movie_count DESC")

    # SELECT COUNT(production_companies.id) as movie_count, production_companies.id, production_companies.movies
    # FROM production-companies
    # LEFT OUTER JOIN "movies"
    #   ON "movies"."production_company_id" = production_company.id
    # GROUP BY "production_company.id"
    # ORDER BY movie_count DESC
  end
end
