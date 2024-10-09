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
Genre.delete_all
MovieGenre.delete_all

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

    # unless movie&valid?
    #  puts "Invalid movie #{movie.title}"
    # end

    genres = m["genre"].split(",").map(&:strip)
    genres.each do |genre_name|
      genre = Genre.find_or_create_by(name: genre_name)
      MovieGenre.create(movie: movie, genre: genre)
    end
  end
end

puts "Created #{ProductionCompany.count} production companies"
puts "Created #{Movie.count} movies"
puts "Created #{Genre.count} genres"
puts "Created #{MovieGenre.count} movie genre relationships"

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
