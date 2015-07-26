class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :city1
      t.string :city1_query1
      t.string :city1_query2
      t.string :city1_query3
      t.string :city1_mcdonalds
      t.string :city2
      t.string :city2_query1
      t.string :city2_query2
      t.string :city2_query3
      t.string :city2_mcdonalds
      t.string :response_id
      t.string :query1 
      t.string :query2
      t.string :query3 

      t.timestamps null: false
    end
  end
end

