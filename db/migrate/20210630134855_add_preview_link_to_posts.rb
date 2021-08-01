class AddPreviewLinkToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :preview_link, :string
  end
end
