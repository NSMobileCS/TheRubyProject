class UsersController < ApplicationController
  def new
    u = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] )
    if u.save
      session[:user_id] = u.id
      redirect_to "/users/" + u.id.to_s + "/show"
    else
      flash[:errors] = ["there was a problem with your username or password"]
      session[:user_id] = nil
      redirect_to '/sessions/new'
    end
  end

  def show
    if session[:user_id]
      if session[:user_id] == params[:id]
        @user = User.find(params[:id])
      else
        flash[:errors] = ["you may only view your own user page"]
        redirect_to '/users/'+User.find(session[:user_id]).id.to_s+'/show'
      end
    else
      flash[:errors] = ["you must be logged in to view user pages"]
      session[:user_id] = nil
      redirect_to '/sessions/new'
    end
  end

  def listshow
    @users = User.all
  end

  def edit
  end



end
