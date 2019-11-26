module EmployeeAuthentication
  extend ActiveSupport::Concern

  def authentication
    if current_employee && [Constant.employee_roles[:admin]].include?(current_employee.role)
      @employees = Employee.all
    else
      @employees = Employee.where({id:current_employee.id})
    end
    @employees
  end
end