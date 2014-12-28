class ArtistsController < ApplicationController
   
  def index
    @artist = Artist.all
    
  end

  def new
    @artist = Artist.new
    
  end
  def show
    @artist = Artist.find(params[:id]) 
    @artits = Artist.all  
  end
  def edit
    @artist = Artist.find(params[:id])
  end

    def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      flash[:notice] = "artist has been updated."

      redirect_to admin_panel_index_path
    
      
    end
    
  end
  private
  def artist_params
      params.require(:artist).permit(:name , :avatar_url,:website ,:youtube_channel,:sound_cloud)
      
    end
end
