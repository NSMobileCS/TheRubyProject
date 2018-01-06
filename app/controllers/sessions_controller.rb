class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.try(:authenticate, params[:password])
        session[:user_id] = @user.id
        redirect_to "/songs"
        # redirect_to "/users/" + @user.id.to_s + "/show"
    else
        flash[:errors] = ["invalid username password combination"]
        redirect_to "/main"
    end
  end

  def destroy
    reset_session
    redirect_to "/main"
  end


end
