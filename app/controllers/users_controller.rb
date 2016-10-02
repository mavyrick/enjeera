class UsersController < ApplicationController

  def new
      @user = User.new
    end

    def create
      if @user = User.setup(user_params, other_params)
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Logged In!"
      else
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                                :password, :password_confirmation)
    end

    def other_params
      params.require(:user).permit(:company_name, :company_admin, :company_description)
    end

end
