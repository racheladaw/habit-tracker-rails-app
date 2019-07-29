class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_or_create_by(email: auth['info']['email']) do |u|
       u.name = auth['info']['name']
       u.password = SecureRandom.hex(8)
      end
      session[:user_id] = @user.id
      redirect_to home_path
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to home_path
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
