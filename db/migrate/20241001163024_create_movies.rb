class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :description
      t.decimal :avg_vote

      t.timestamps
    end
  end
end
