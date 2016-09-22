class CompanyUsersController < ApplicationController

  def new
    @company_user = CompanyUser.new
  end

  def create
    @company_user = CompanyUser.new company_user_params
    if @company_user.save
      session[:company_user_id] = @company_user.id
      redirect_to root_path, notice: "Logged In!"
    else
      render :new
    end
  end

  private

  def company_user_params
    params.require(:company_user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
