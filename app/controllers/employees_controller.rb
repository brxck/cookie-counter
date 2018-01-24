class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      flash[:success] = 'Employee was successfully created.'
      redirect_to @employee
    else
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      flash[:success] = 'Employee was successfully updated.'
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    flash[:success] = 'Employee was successfully deleted.'
    redirect_to employees_url
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.fetch(:employee, {})
  end
end
