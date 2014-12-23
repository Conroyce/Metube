class Comment < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :commentable, polymorphic:true
  has_many :comments, :as => :commentable
end
