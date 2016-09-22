class CompaniesController < ApplicationController

  before_action :authenticate_company_user!, except: [:index, :show]

  def index
    @companies = Company.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find params[:id]
  end

end
