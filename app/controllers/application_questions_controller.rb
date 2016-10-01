class ApplicationQuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @company = current_user.company
    @questions = @company.application_questions
  end

  def new
    @company = current_user.company
    @application_question = @company.application_questions.new
  end

  def create
    @company = current_user.company
    @application_question = @company.application_questions.new application_question_params
    if @application_question.save
      redirect_to company_application_questions_path(@company), notice: "Company application questions created!"
    else
      flash[:alert] = "cannot create!"
      render :index
    end

  end

  def update
    @company = current_user.company
    @application_question = ApplicationQuestion.find params[:id]
    @application_question.update application_question_params
    flash[:notice] = "Company application questions updated!"
    redirect_to company_application_questions_path(@company)
  end

  private

    def application_question_params
      # params.require(:application_question).permit( application_questions_attributes: [:question, :answer, :_destroy, :id])
      params.require(:application_question).permit(:question, :answer, :_destroy, :id)
    end

end
