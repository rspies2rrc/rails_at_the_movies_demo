class Movie < ApplicationRecord
  belongs_to :production_company
  validates :title, uniqueness: true
  validates :year, numericality: true
  validates :avg_vote, numericality: true
  validates :duration, numericality: true
  validates :title, :description, :avg_vote, :year, :duration, presence: true
end
