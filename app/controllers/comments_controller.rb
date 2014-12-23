require 'pry-byebug'

class CommentsController < ApplicationController
  before_action :set_video

  def index
    @comments = @video.comments
  end  

  def create
    par = ""
    if (params["playlist_id"])
      par = "playlist_id"
    elsif (params["video_id"])
      par = "video_id"
    end
    
    params['comment'][par] = params[par] #par = 'video_id' 
    @comment = Comment.create(comment_create)
    
    if (par == "playlist_id")
      redirect_to "/playlists/#{@comment['playlist_id']}"
    elsif(par == "video_id")
      redirect_to "/videos/#{@comment['video_id']}"
    end
  end  

  def new
    @comment = Comment.new
  end
  
  def show
    @comment = Comment.find(params[:id])  
  end 

  def edit
  end  

  def update
    @comment = Comment.update(params[:id],description: params[@name][:description]) #:comment
    if (@par == "playlist_id")
      redirect_to "/playlists/#{@comment['playlist_id']}"
    elsif(@par == "video_id")
      redirect_to "/videos/#{@comment['video_id']}"
    end  
  end  

  def comment_create 
    par = ""
    if (params["playlist_id"]) 
      par = "playlist_id"
      name = :playlist
    elsif (params["video_id"])
      par = "video_id"
      name = :playlist
    end  
    params['comment'][par] = params[par]
    params.require(:comment).permit(:description, name, :commentable_id, :commentable_type)
  end 

  def destroy
    @comment = Comment.delete(params[:id])
    if (@par == "playlist_id")
      redirect_to "/videos/#{params[:playlist_id]}"
    elsif (@par == "video_id")  
      redirect_to "/videos/#{params[:video_id]}"
    end  
  end  

  private

  def set_video
    if (params[:video_id])
      @video = Video.find(params[:video_id])
      @par = "playlist_id"
      @name = :playlist
    elsif (params[:playlist_id]) 
      @playlist = Playlist.find(params[:playlist_id])
      @par = "video_id"
      @name = :video
    end 
  end  
end
