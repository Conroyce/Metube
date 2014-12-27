

class VideosController < ApplicationController

  def index
    if (session[:user_id])
      @user = User.find(session[:user_id])
    else  
    end  
    @videos = Video.all
  end  

  def create
    @video = Video.create(video_params)
    redirect_to '/videos/#{@video.id}'
  end 

  def new
    @video = Video.new
  end 

  def show
    @video = Video.find(params[:id])
    @comments = Comment.where("commentable_id = #{params[:id]}")
  end 

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to "/videos/#{@video.id}"
  end 

  def destroy
    @video = Video.delete(params[:id])
    redirect_to "/videos"
  end 

  def video_params
    params.require(:video).permit(:title,:url,:description)
  end 
end
