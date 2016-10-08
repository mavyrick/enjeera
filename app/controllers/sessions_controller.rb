class SessionsController < ApplicationController

  def oauth2
    # render json: request.env['omniauth.auth']
    omniauth_data = request.env['omniauth.auth']
    user = User.where(provider: omniauth_data['provider'], uid: omniauth_data["uid"]).first
    if user.nil?
      user = User.create_from_linkedin(omniauth_data)
    end
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def auth
    client = LinkedIn::Client.new
    client.authorize_from_access()
  end

  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in"
    else
      flash[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_path, notice: "Logged out!"
 end

end
