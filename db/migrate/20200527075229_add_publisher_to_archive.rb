class AddPublisherToArchive < ActiveRecord::Migration[5.2]
  def change
    add_column :archives, :publisher, :text
  end
end
