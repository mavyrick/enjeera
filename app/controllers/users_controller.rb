class UsersController < ApplicationController

  def index
    @users = User.where(company_admin: false).order(created_at: :desc).page(params[:page]).per(10)
  end


  def new
      @user = User.new
    end

  def show
    @user = User.find params[:id]
  end

    def create
      if @user = User.setup(user_params, other_params)
        # && @user.company_admin == false
        session[:user_id] = @user.id
        redirect_to edit_user_path(current_user), notice: "Logged In!"
      # elsif @user = User.setup(user_params, other_params)
      #   # && @user.company_admin == true
      #   session[:user_id] = @user.id
      #   redirect_to edit_company_path(current_user.company), notice: "Logged In!"
      else
        @user = User.new
        render :new
      end
    end

    def edit
      @user = User.find params[:id]
    end

    def update
      @user = User.find params[:id]
      @user.update user_params
      flash[:notice] = "User profile editted successfully"
      redirect_to user_path(@user)
    end

    private

    def user_params
      params.require(:user).permit(:user_name, :first_name, :last_name, :tagline, :email,
                                                :password, :password_confirmation, :picture, :summary, :link)
    end

    def other_params
      params.require(:user).permit(:company_name, :company_admin, :company_description)
    end

end
