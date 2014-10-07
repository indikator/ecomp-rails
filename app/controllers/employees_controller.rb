class EmployeesController < ApplicationController
  def index
    @employees = Employee.tree
  end
end