class AddArchiveIdToDataSets < ActiveRecord::Migration[5.2]
  def change
    add_reference :data_sets, :archive, index: true
  end
end
