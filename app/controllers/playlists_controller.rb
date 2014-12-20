class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
    @play = Playlist.new
  end  

  def create 
    @playlist = Playlist.create(playlist_params)
    redirect_to "/playlists"
  end  

  def show
    
    @playlist = Playlist.find(params[:id])
    binding.pry
    @playArr = []
    @playlist.video_ids.each do |x|
      @vid = Video.find(x)    
      @playArr.push(@vid)
    end

    puts "hi there"
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
      params.require(:playlist).permit(:title, video_ids:[])
    end

    def playlist_vid_params
      params.require(:playlist_vids).permit(:title, video_ids:[])
    end
end
