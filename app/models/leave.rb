class Leave < ActiveRecord::Base
  has_many :leave_types
  belongs_to :employee
end
