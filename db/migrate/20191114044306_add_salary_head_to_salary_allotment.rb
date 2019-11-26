class AddSalaryHeadToSalaryAllotment < ActiveRecord::Migration
  def change
    add_reference :salary_allotments, :salary_head, index: true, foreign_key: true
    add_reference :salary_allotments, :employee, index: true, foreign_key: true
    add_column :salary_allotments, :amount, :integer
    remove_column :salary_allotments, :basic, :integer
    remove_column :salary_allotments, :da, :integer
    remove_column :salary_allotments, :hra, :integer
    remove_column :salary_allotments, :convenyance, :integer
    remove_column :salary_allotments, :meal_allowance, :integer
    remove_column :salary_allotments, :special_allowance, :integer

  end
end
