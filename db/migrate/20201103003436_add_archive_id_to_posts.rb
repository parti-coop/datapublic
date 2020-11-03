class AddArchiveIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :archive, null: true, foreign_key: true
  end
end
