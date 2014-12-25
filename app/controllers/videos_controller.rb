

class VideosController < ApplicationController

  def index
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
    binding.pry
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
