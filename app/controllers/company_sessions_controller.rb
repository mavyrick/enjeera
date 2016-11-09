class CompanySessionsController < ApplicationController
  def create
    @company_user = CompanyUser.find_by_email params[:email]
    if @company_user && @company_user.authenticate(params[:password])
      session[:company_user_id] = @company_user.id
      redirect_to root_path, noticed: 'Logged in'
    else
      flash[:alert] = 'Wrong email or password'
      render :new
    end
  end

  def destroy
    session[:company_user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
