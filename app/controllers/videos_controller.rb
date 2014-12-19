

class VideosController < ApplicationController
  def index
    @videos = Video.all
  end  

  def create
    @video = Video.create(video_create)
    redirect_to '/videos'
  end 

  def new
    @video = Video.new
  end 

  def show
    @video = Video.find(params[:id])
  end 

  def edit

  end

  def update
    @video = Video.update(params)
  end 

  def destroy
    @video = Video.delete(params[:id])
    redirect_to "/videos"
  end 

  def video_create
    params.require(:video).permit(:title,:url,:description)
  end 
end
