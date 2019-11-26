class CreateLeaveTypes < ActiveRecord::Migration
  def change
    create_table :leave_types do |t|
      t.string :name
      t.integer :count
      t.integer :payday
      t.integer :weekoff
      t.integer :present_days
      t.integer :applied_leave
      t.integer :remaining_leaves
      t.timestamps null: false
    end
  end
end
