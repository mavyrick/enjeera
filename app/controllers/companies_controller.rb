class CompaniesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @companies = Company.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @company = Company.new
  end

  def create
    company_params = params.require(:company).permit(:title, :description)
    @company = Company.create company_params

    if @company.save
      flash[:notice] = "Company created successfully"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @company = Company.find params[:id]
    @applying = @company.applying_for(current_user)
  end

  def edit
    @company = Company.find params[:id]
  end

  def update
    @company = Company.find params[:id]
    @company.update company_params
    flash[:notice] = "Company profile editted successfully"
    redirect_to company_path(@company)
  end

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
      params.require(:company).permit(:title, :description, :attachment)
    end

end
