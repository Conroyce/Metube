require 'pry-byebug'

class CommentsController < ApplicationController
  before_action :set_video

  def index
    if (session[:user_id])
      @comments = Comment.where("user_id = #{session[:user_id]}")
    elsif (params["playlist_id"])
      @playlist = Playlist.find(params["playlist_id"])
      @comments = @playlist.comments  
    else
     @comments = Comment.all
    # @comments = @video.comments
    end
  end  

  def create
    par = ""
    if (params["playlist_id"])
      par = "playlist_id"
    elsif (params["video_id"])
      par = "video_id"
    end
              #NEED TO FIND WAY TO DISPLAY COMMENTS(PROLLY USE FIND/FIND_BY METHOD)
    params['comment'][par] = params[par] #par = 'video_id' 
    
    if (session[:user_id])
      param = comment_params
      param["user_id"] = "#{session[:user_id].to_s} #{params[:description].to_s}" 
      @comment = Comment.create(param)
    else
      @comment = Comment.create(comment_params)  
    end

    if (par == "playlist_id")
      redirect_to "/playlists/#{params['playlist_id']}"
    elsif(par == "video_id")
      redirect_to "/videos/#{params['video_id']}"
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

    @comment = Comment.update(params[:id],description: params[:comment][:description]) #:comment
    if (@par == "playlist_id")
      redirect_to "/playlists/#{@comment['playlist_id']}"
    elsif(@par == "video_id")
      redirect_to "/videos/#{@comment['video_id']}" 
    end  
  end  

  def comment_params 
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
    if (params[:playlist_id])
      @playlist = Playlist.find(params[:playlist_id])
      @par = "playlist_id"
      @name = :playlist
    elsif (params[:video_id])
      @video = Video.find(params[:video_id]) 
      @par = "video_id"
      @name = :video
    end 
  end  
end
