class CreateArchives < ActiveRecord::Migration[5.2]
  def change
    create_table :archives do |t|
      t.string "title", null: false
      t.text "body"
      t.integer "user_id", null: false
      t.integer "likes_count", default: 0
      t.string "slug"
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
