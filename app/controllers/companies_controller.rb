class CompaniesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @company = Company.new
  end

end
