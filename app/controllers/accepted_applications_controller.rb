class AcceptedApplicationsController < ApplicationController
  before_action :authenticate_user!

  def create
    accepted_application = current_user.accepted_applications.new
    applying = Applying.find params[:applying_id]
    accepted_application.applying = applying
    if accepted_application.save
      redirect_to company_applyings_path(applying.company), notice: 'Application accepted!'
    else
      redirect_to company_applyings_path(applying.company), alert: "Can't accept!"
    end
  end

  def destroy
    accepted_application = current_user.accepted_applications.find params[:id]
    accepted_application.destroy
    redirect_to applyings_path, notice: 'Unaccepted'
  end
end
