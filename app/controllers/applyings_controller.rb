class ApplyingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @applying = Applying.new
    @company = Company.find params[:company_id]
  end

  def index
    @company = Company.find params[:company_id]
    @applyings = @company.applyings.order(created_at: :desc).page(params[:page]).per(25)
    # @accepted_application = @applying.accepted_application_for(current_user)
    if current_user.company != @company
      redirect_to(root_path, notice: 'access denied') && return
    end
  end

  # def show
  #   @company = Company.find params[:company_id]
  #   # @applying = Applying.find params[:id]
  #   # @company = Company.find params[:id]
  #   # @applying = @company.applying_for(current_user)
  # end

  def create
    company = Company.find params[:company_id]
    applying = current_user.applyings.build
    company.application_questions.each do |q|
      applying.application_answers.build(application_question: q, answer: params["answer_#{q.id}"])
      q.application_answers.build(applying: applying, answer: params["answer_#{q.id}"])
    end
    applying.company = company
    if applying.save
      redirect_to company_path(company), notice: 'Applied!'
    else
      redirect_to company, alert: "Can't Apply!"
    end
  end

  def update
    @applying = Applying.find params[:id]
    if @applying.update(accepted: true)
      redirect_to applying_path(@applying), notice: 'Application accepted'
    else
      redirect_to applying_path, alert: "Can't accept!"
    end
  end

  # def create
  #   applying = current_user.applyings.new
  #   company = Company.find params[:company_id]
  #  #  applying_params = params.require(:applying).permit(:answer_field)
  #   @Applying = Applying.create[:answer_field]
  #   applying.company = company
  #   if applying.save
  #     redirect_to companies_path, notice: "Applied!"
  #   else
  #     redirect_to company, alert: "Can't Apply!"
  #   end
  # end

  def destroy
    @applying = Applying.find params[:id]
    @company = Company.find params[:company_id]
    @applying.destroy
    redirect_to company_applyings_path(@company), notice: 'Application Deleted'
  end

  def status_change
    @applying = Applying.find params[:id]

    @applying.accepted = if @applying.accepted == 'Not Done'
                           'Done'
                         elsif @applying.accepted == 'Done'
                           'Not Done'
                         else
                           'Not Done'
                         end

    @applying.save

    redirect_to company_applyings_path
  end

  def show
    @user = current_user
    @applyings = @user.applyings.order(created_at: :desc).page(params[:page]).per(25)
  end
end
