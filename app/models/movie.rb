class Movie < ApplicationRecord
  belongs_to :production_company
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  validates :title, uniqueness: true
  validates :year, numericality: true
  validates :avg_vote, numericality: true
  validates :duration, numericality: true
  validates :title, :description, :avg_vote, :year, :duration, presence: true

  def genre_list
    genres.map(&:name).join(", ")
  end
end
