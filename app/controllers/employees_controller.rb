class EmployeesController < ApplicationController
  before_action :authenticate_user!
  def index
    @employees = Employee.all
  end

  def new

    @employee = Employee.new
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render :new
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_path
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to employee_path
    else
      render :edit
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:name,pictures_attributes: [:id, :name, :attachment, :_destroy])
    end
end
