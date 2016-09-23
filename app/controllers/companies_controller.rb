class CompaniesController < ApplicationController

  before_action :authenticate_company_user!, except: [:index, :show]

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
  end

  def edit
    @company = Company.find params[:id]
  end

  def update
    @company = Company.find params[:id]
    @company.update params.require(:company).permit([:title, :description, :attachment])
    flash[:notice] = "Company profile editted successfully"
    redirect_to company_path(@company)
  end

end
