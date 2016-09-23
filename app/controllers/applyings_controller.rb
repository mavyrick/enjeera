class ApplyingsController < ApplicationController

  before_action :authenticate_user!

 def create
   applying = current_user.applyings.new
   company = Company.find params[:company_id]
   applying.company = company
   if applying.save
     redirect_to company, notice: "Applied!"
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
