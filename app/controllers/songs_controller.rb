class SongsController < ApplicationController
  def index 
    @songs = Song.all
  end  
  def new 
    @song = Song.new

  end 

   def create

    # byebug
    # @artist = Artist.find_or_create_by(name: song_params[:song][:artist])
    # @genre = Artist.find_or_create_by(name: song_params[:song][:genre])
    @song=Song.create(song_params)
    redirect_to @song

   end 

   def show
    @song = Song.find(params[:id])
   
   end 

   def edit 
    @song = Song.find(params[:id])

   end

   def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to @song
   end 

    def song_params
      params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
