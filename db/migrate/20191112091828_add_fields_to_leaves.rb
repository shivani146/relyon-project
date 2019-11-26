class AddFieldsToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :name, :string
    add_column :leaves, :count, :integer
    add_column :leaves, :applied_leaves, :integer
    add_column :leaves, :remaining_leaves, :integer
    add_column :leaves, :week_off, :integer
    add_column :leaves, :present_days, :integer
    rename_column :leaves, :employeeid, :employee_id
    add_column :leaves, :total_applied_leaves, :integer
    # change_column :leaves, :employee_id, :integer

  end
end
