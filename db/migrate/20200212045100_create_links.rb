class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.belongs_to :data_set
      t.string :title
      t.string :url
      t.text :body

      t.timestamps
    end
  end
end