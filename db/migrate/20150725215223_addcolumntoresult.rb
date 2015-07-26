class Addcolumntoresult < ActiveRecord::Migration
  def change
    add_column :results, :query1, :string
    add_column :results, :query2, :string
    add_column :results, :query3, :string

  end
end
