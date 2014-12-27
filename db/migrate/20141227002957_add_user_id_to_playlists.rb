class AddUserIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
