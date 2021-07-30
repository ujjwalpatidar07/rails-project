class CompaniesController < ApplicationController
  before_action :authenticate_user!
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render :new
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to companies_path
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to company_path
    else
      render :edit
    end
  end

  private
    def company_params
      params.require(:company).permit(:name,pictures_attributes: [:id, :name, :attachment, :_destroy])
    end
end
