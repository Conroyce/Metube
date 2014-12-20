class Comment < ActiveRecord::Base
  validates :description, presence: true
  has_many :playlists
  has_many :videos, through: :playlists
end
