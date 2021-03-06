class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @companies = Company.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @company = Company.new
  end

  def create
    company_params = params.require(:company).permit(:title, :description, :picture, :company_description)
    @company = Company.create company_params

    if @company.save
      flash[:notice] = 'Company created successfully'
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @company = Company.find params[:id]
    @companies = Company.all
    @applying = @company.applying_for(current_user)
    @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
      marker.lat company.latitude
      marker.lng company.longitude
    end
  end

  def edit
    @company = Company.find params[:id]
    if current_user.company != @company
      redirect_to(root_path, notice: 'access denied') && return
    end
  end

  def update
    @company = Company.find params[:id]
    @company.update company_params
    flash[:notice] = 'Company profile editted successfully'
    redirect_to company_path(@company)
  end

  def application_status
    @user = current_user
    @applications = @user.applyings.order(created_at: :desc).page(params[:page]).per(25)
    if current_user != @user
      redirect_to(root_path, notice: 'access denied') && return
    end
  end

  # def destroy
  #   @company = Company.find params[:company_id]
  #   @application_question = ApplicationQuestion.find params[:id]
  #   @application_question.destroy
  #   redirect_to company_application_questions_path(@application_question), notice: "Question Deleted"
  # end

  # def destroy
  #   company = Company.find params[:id]
  #   company.destroy
  #   redirect_to company_application_question_path
  # end

  def applying_for(user)
    applyings.find_by_user_id(user)
  end

  private

  def company_params
    params.require(:company).permit(:title, :tag_line, :description, :company_description, :picture, :link, :include_map, :latitude, :longitude)
  end
end
