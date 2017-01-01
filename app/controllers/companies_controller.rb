class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.new
  end

  def create
    @company = current_user.companies.build(comapny_params)
    if @company.save
      redirect_to user_company_path(current_user, @company)
    else
      render :new
    end
  end

  def update
  end

  def index
    @companies = current_user.companies
  end

  def show
    @user = current_user
    @company = Company.find(params[:id])
  end

  private

  def comapny_params
    params.require(:company).permit(:name, :address)
  end
end
