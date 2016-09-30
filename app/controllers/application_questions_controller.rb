class ApplicationQuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @company = current_user.company
  end


  def create
    @company = current_user.company
    @company.update(company_params)
    flash[:notice] = "Company application questions updated!"
    redirect_to application_questions_path
  end

  private

    def company_params
      params.require(:company).permit( application_questions_attributes: [:question, :answer, :_destroy, :id])
    end

end
