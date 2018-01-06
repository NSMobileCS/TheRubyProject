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
    song = Song.new(title: params[:title], artist: params[:artist])
    if song.save
      like = Songlike.create(user: user, song: song, count: 1)
    else
      flash[:errors] = ['song error make sure you have put in a correct title and artist']
    end
    redirect_to '/songs'
  end


  def show
    @song = Song.find(params[:id])
    puts '________*&&&&&&&&&SONG TITLE!!!!!!**'
    puts @song.title

    # @likes = Songlike.where(song: @song).where.not(user: @user)
    # @users = @song.users.where.not(id: @user).take
  end

  def like_song
    user = User.find(session[:user_id])
    song = Song.find(params[:id])
    if !user
      redirect_to '/main'
    end
    songlike = Songlike.where(user: user, song: song).take
    if songlike
      songlike.count += 1
      songlike.save
    else
      songlike = Songlike.create(user: user, song: song, count: 1)
    end
    redirect_to '/songs'
  end
end
