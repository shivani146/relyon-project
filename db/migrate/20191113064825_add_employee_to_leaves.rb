class AddEmployeeToLeaves < ActiveRecord::Migration
  def change
    add_reference :leaves, :employee, index: true, foreign_key: true
  end
end
