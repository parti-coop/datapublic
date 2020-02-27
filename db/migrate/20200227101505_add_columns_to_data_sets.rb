class AddColumnsToDataSets < ActiveRecord::Migration[5.2]
  def change
    add_column :data_sets, :url, :string
    add_column :data_sets, :api_url, :string
  end
end
