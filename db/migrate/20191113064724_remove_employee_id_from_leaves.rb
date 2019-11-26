class RemoveEmployeeIdFromLeaves < ActiveRecord::Migration
  def change
    remove_column :leaves, :employee_id, :integer
  end
end
