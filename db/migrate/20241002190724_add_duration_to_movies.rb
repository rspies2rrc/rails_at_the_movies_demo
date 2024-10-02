class AddDurationToMovies < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :duration, :integer
  end
end
