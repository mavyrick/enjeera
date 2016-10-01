class ApplyingsController < ApplicationController

  before_action :authenticate_user!

  def new
    @applying = Applying.new
    @company = Company.find params[:company_id]
  end

  def index
    @applyings = Applying.order(created_at: :desc).page(params[:page]).per(10)
  end

  # def show
  #   @company = Company.find params[:company_id]
  #   # @applying = Applying.find params[:id]
  #   # @company = Company.find params[:id]
  #   # @applying = @company.applying_for(current_user)
  # end

 def create
   applying = current_user.applyings.new
   company = Company.find params[:company_id]
  #  applying_params = params.require(:applying).permit(:answer_field)
   @Applying = Applying.create[:answer_field]
   applying.company = company
   if applying.save
     redirect_to companies_path, notice: "Applied!"
   else
     redirect_to company, alert: "Can't Apply!"
   end
 end

 def destroy
   applying = current_user.applyings.find params[:id]
   applying.destroy
   redirect_to applying.company, notice: "Application Cancelled"
 end
end
