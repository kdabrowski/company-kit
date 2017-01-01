class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.new
  end

  def create
    @company = current_user.companies.build(company_params)
    if @company.save
      redirect_to user_company_path(current_user, @company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      redirect_to user_company_path(current_user, @company)
    else
      redirect_to :edit
    end

  end

  def index
    @companies = current_user.companies
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :address)
  end
end
