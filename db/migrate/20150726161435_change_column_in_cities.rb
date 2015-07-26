class ChangeColumnInCities < ActiveRecord::Migration
  def change
    rename_column :cities, :country, :timezone
  end
end
