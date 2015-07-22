class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    Song.create(song_params)
    redirect_to songs_path
  end

  def edit
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
