class CreateSalaryHeads < ActiveRecord::Migration
  def change
    create_table :salary_heads do |t|
      t.string :salaryname
      t.boolean :earnings
      t.boolean :deduction

      t.timestamps null: false
    end
  end
end
