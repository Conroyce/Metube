class CreatePlaylistVids < ActiveRecord::Migration
  def change
    create_table :playlist_vids do |t|
      t.belongs_to :video, index: true
      t.belongs_to :playlist, index: true

      t.timestamps
    end
  end
end
