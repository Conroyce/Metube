require 'pry-byebug'

class CommentsController < ApplicationController
  before_action :set_video

  def index
    @comments = @video.comments
  end  

  def create
    params['comment']['video_id'] = params['video_id']
    @comment = Comment.create(comment_create)
    redirect_to "/videos/#{@comment.video_id}"
  end  

  def new
    @comment = Comment.new
  end
  
  def show
    @comment = Comment.find(params[:id])  
  end 

  def update
    @comment = Comment.update(params[:id],description: params[:comment][:description])
    redirect_to "/videos/#{@comment.video_id}"
  end  

  def comment_create
    params['comment']['video_id'] = params['video_id']
    params.require(:comment).permit(:description, :video_id)
  end 

  def destroy
    @comment = Comment.delete(params[:id])
    redirect_to "/videos/#{params[:video_id]}"
  end  

  private

  def set_video
    @video = Video.find(params[:video_id])
  end  
end
