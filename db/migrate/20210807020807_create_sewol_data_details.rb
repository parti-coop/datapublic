class CreateSewolDataDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sewol_data_details do |t|
      t.string :content
      t.string :content_name
      t.string :content_type
      t.integer :content_size
      t.string :media_type
      t.string :category_slug
      t.string :content_source
      t.string :content_recipients
      t.string :donor
      t.boolean :is_secret_donor
      t.string :content_created_date
      t.string :content_created_time
      t.belongs_to :data_set, foreign_key: true
      t.timestamps
    end
  end
end
