class LeaveType < ActiveRecord::Base
  belongs_to :employee, :inverse_of => :leave_type
  validate :validate_leave_type

  def validate_leave_type
    leave_type =  LeaveType.find_by(name: name)
    if leave_type.present? && leave_type.id != id
      errors.add(:name, "Name #{name} Invalid. It already present with count of #{leave_type.count}")
      return
    end

  end

end
