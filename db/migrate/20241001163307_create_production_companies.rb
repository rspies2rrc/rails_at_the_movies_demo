class CreateProductionCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :production_companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
