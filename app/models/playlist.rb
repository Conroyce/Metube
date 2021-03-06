class Playlist < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  has_many :playlist_vids
  has_many :videos, through: :playlist_vids
  has_many :comments, :as => :commentable
end
