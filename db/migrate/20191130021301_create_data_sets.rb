class CreateDataSets < ActiveRecord::Migration[5.2]
  def change
    create_table :data_sets do |t|
      t.string :title
      t.string :body
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
