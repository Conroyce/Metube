class Video < ActiveRecord::Base
  validates :title, :url, presence: true
  has_many :playlist_vids
  has_many :playlists, through: :playlist_vids
  has_many :comments, through: :playlists
end
