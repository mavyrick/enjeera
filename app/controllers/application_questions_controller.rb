class ApplicationQuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @company = Company.find params[:company_id]
    if current_user.company != @company
      redirect_to root_path, notice: "access denied" and return
    end
    @application_questions = @company.application_questions
    @application_questions = ApplicationQuestion.order(:position)
    # @application_questions = ApplicationQuestion.all
  end

  def new
    @company = current_user.company
    @application_question = @company.application_questions.new
  end

  def show
    @application_questions = ApplicationQuestion.order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    @company = Company.find params[:company_id]
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

  def destroy
    @company = Company.find params[:company_id]
    @application_question = ApplicationQuestion.find params[:id]
    @application_question.destroy
    redirect_to company_application_questions_path(@application_question), notice: "Question Deleted"
  end

  def sort
    params[:application_question].each_with_index do |id, index|
      ApplicationQuestion.find(id).update!(position: index + 1)
    end
    head :ok
  end

  private

    def application_question_params
      # params.require(:application_question).permit( application_questions_attributes: [:question, :answer, :_destroy, :id])
      params.require(:application_question).permit(:question, :answer, :_destroy, :id)
    end

end
