class CreateSalaryDeductions < ActiveRecord::Migration
  def change
    create_table :salary_deductions do |t|
      t.integer :pf
      t.integer :esi
      t.integer :pt

      t.timestamps null: false
    end
  end
end
