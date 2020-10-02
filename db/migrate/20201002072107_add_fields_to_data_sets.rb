class AddFieldsToDataSets < ActiveRecord::Migration[5.2]
  def change
    add_column :data_sets, :publisher, :string
    add_column :data_sets, :file_type, :string
    add_column :data_sets, :properties, :text
    add_column :data_sets, :data_created_at, :string
    add_column :data_sets, :data_updated_at, :string
    add_column :data_sets, :license, :string
    add_column :data_sets, :memo, :text
  end
end
