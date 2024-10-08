# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"

Movie.delete_all
ProductionCompany.delete_all
Page.delete_all

filename = Rails.root.join("db/top_movies.csv")

csv_data = File.read(filename)

movies = CSV.parse(csv_data, headers: true, encoding: "utf-8")

movies.each do |m|
  production_company = ProductionCompany.find_or_create_by(name: m["production_company"])

  if production_company&.valid?
    movie = production_company.movies.create(
      title: m["original_title"],
      year: m["year"],
      avg_vote: m["avg_vote"],
      description: m["description"],
      duration: m["duration"],
    )
  end
end

Page.create(
  title: "about",
  content: "Data provided by...",
  permalink: "about_us"
)

Page.create(
  title: "Contact Us",
  content: "We can be reached at mycoolemailaddress@rrc.ca",
  permalink: "contact_us"
)
