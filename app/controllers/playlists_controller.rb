class PlaylistsController < ApplicationController
  def index
    if (session[:user_id])
      @user = User.find(session[:user_id])
      @playlist = @user.playlists
    else   
      @playlists = Playlist.all
    end  
    @play = Playlist.new
  end  

  def create 
      if (session[:user_id])
        par = playlist_params
        par["user_id"] = "#{session[:user_id].to_s} #{params[:title].to_s}"
        @playlist = Playlist.create(par)
      else 
        @playlist = Playlist.create(playlist_params)
      end  
     
    redirect_to "/playlists"
  end  

  def show
    @playlist = Playlist.find(params[:id])
    if (session[:user_id])
      @comments = Comment.where("user_id = #{session[:user_id]}")
    else      
      @comments = Comment.where("commentable_id = #{params[:id]}")  
    end  
    @playArr = []
    @playlist.video_ids.each do |x|
      @vid = Video.find(x)    
      @playArr.push(@vid)
    end  
  end  

  def destroy
    @playlist = Playlist.delete(params[:id])
    redirect_to "/playlists"
  end  

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_vid_params)
        
    redirect_to "/playlists/#{@playlist.id}"
  end  

  private
    def playlist_params
      params.require(:playlist).permit(:title, :user_id, video_ids:[]) #could cause an error
    end

    def playlist_vid_params
      params.require(:playlist_vids).permit(:title, video_ids:[])
    end
end
