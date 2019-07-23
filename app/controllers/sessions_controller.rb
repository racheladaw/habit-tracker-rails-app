class SessionsController < ApplicationController

  def new
  end

  def create
    if auth['info']['email']
      @user = User.find_or_create_by(email: auth['info']['email']) do |u|
       u.name = auth['info']['name']
       u.password = SecureRandom.hex(8)
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.find_by(username: params[:username])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to new_session_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
