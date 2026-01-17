class CreateAlbumsTagJoinTable < ActiveRecord::Migration[8.1]
  def change
    create_table :albums_tags,id: false do |t|
      t.references :album, null: false, foreign_key: true
      t.references :tag, null:false, foreign_key: true
    end
    add_index :albums_tags,[:album_id, :tag_id], unique: true
  end 
end
