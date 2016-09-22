class CompanyUsersController < ApplicationController

  def new
    @company_user = CompanyUser.new
    @company = Company.new
  end

  def create
    @company_user = CompanyUser.new company_user_params
    @company = Company.new
    @company.title = params["company_user"]["company_name"]
    @company.save
    if @company_user.save
      session[:company_user_id] = @company_user.id
      redirect_to company_path(@company), notice: "Logged In!"
    else
      render :new
    end
  end

  private

  def company_user_params
    params.require(:company_user).permit(:company_name, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  # def company_params
  #   params.require(:company).permit(:company_name)
  # end


end
