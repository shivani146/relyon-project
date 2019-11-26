class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.string :name
      t.integer :count
      t.integer :applied_leave
      t.integer :remaining_leaves
      t.integer :payday
      t.integer :weekoff
      t.integer :present_days
      t.timestamps null: false
    end
  end
end
