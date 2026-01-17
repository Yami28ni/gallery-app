class RemoveAlbumIdFromTags < ActiveRecord::Migration[8.1]
  def change
    remove_reference :tags, :album, null: false, foreign_key: true
  end
end
