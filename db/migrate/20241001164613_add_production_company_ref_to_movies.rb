class AddProductionCompanyRefToMovies < ActiveRecord::Migration[7.2]
  def change
    add_reference :movies, :production_company, null: false, foreign_key: true
  end
end
