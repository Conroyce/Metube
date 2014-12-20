class Playlist < ActiveRecord::Base
  validates :title, presence: true
  has_many :playlist_vids
  has_many :videos, through: :playlist_vids
  belongs_to :comment
end
