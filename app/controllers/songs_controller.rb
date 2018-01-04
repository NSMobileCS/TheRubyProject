class SongsController < ApplicationController
  def dashboard
    @songs = Song.all
  end

  def create  #creates a song; auto add it to user's playlist
    user = User.find(session[:user_id])
    song = Song.create(title: params[:title], artist: params[:artist])
    playlist = Playlist.find_by(user: user)
    ac = Addcount.create(user: user, song: song, count: 1)
  end

  def add
    user = User.find(session[:user_id])
    song = Song.find(params[:id])
    user.playlist.songs.push(song)
    ac = Addcount.where(user: user).where(song: song).take
    if ac
      ac.count += 1
      ac.save
    else
      ac = Addcount.create(user: user, song: song, count: 1)
    end
    redirect_to "/dashboard"
  end


  def show
    @song = Song.find(params[:id])
    @users = User.all
  end

end
