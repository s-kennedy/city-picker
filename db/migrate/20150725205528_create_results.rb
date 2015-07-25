class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :city1
      t.string :city1_swimmingpools
      t.string :city1_museums
      t.string :city1_bars
      t.string :city1_mcdonalds
      t.string :city1_paintball
      t.string :city2
      t.string :city2_swimmingpools
      t.string :city2_museums
      t.string :city2_bars
      t.string :city2_mcdonalds
      t.string :city2_paintball

      t.timestamps null: false
    end
  end
end

