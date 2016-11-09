class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to new_session_path, notice: 'Please sign in' unless user_signed_in?
  end

  def authenticate_company_user!
    redirect_to new_company_session_path, notice: 'Please sign in' unless company_user_signed_in?
  end

  def signed_in?
    current_user.present? || current_company_user.present?
  end
  helper_method :signed_in?

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def company_user_signed_in?
    current_company_user.present?
  end
  helper_method :company_user_signed_in?

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end
  helper_method :current_user

  def current_company_user
    @current_company_user ||= CompanyUser.find_by_id session[:company_user_id]
  end
  helper_method :current_company_user
end
