class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.integer :city_id
      t.string :latitude
      t.string :longitude
      t.string :country_code
      t.string :country

      t.timestamps null: true
    end
  end
end
