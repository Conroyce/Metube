class Comment < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :video
end
