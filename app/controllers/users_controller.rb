class UsersController < ApplicationController
  def new
    u = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] )
    if u.save
      pl = Playlist.new(user: u)
      session[:user_id] = u.id
      redirect_to "/users/" + u.id.to_s
    else
      flash[:errors] = ["there was a problem with your username or password"]
      session[:user_id] = nil
      redirect_to '/sessions/new'
    end
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
      @playlist = Playlist.find_by(user: @user)
    else
      flash[:errors] = ["you must log in"]
      redirect_to '/main'
    end
  end

  def listshow
    @users = User.all
  end


end