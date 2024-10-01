class Movie < ApplicationRecord
  belongs_to :production_company
  validates :title, uniqueness: true
  validates :year, numericality: true
  valdiates :avg_vote, numericality: true
  validates :title, :description, :avg_vote, :year, presence: true
end
