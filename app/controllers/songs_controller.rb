class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    session[:most_recent_song_title] = Song.last.title
    @songs = Song.all

  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    if current_user
      @song = current_user.songs.new(song_params)
      if @song.save
        flash[:success] = "#{@song.title} has been added!"
        redirect_to current_user
      else
        flash[:danger] = "Title is missing!"
        redirect_to new_song_path
      end
    else
      @song = Song.new(song_params)
      if @song.save
        flash[:success] = "#{@song.title} has been added!"
        redirect_to songs_path
      else
        flash[:danger] = "Title is missing!"
        redirect_to new_song_path
      end
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song.update(song_params)
    redirect_to @song
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
