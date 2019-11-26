module ApplyLeavesHelper
  def self.get_leave_names

    @leave_names = LeaveType.all.pluck(:name)
  end
end
