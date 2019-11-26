class CreateSalaryAllotments < ActiveRecord::Migration
  def change
    create_table :salary_allotments do |t|
      t.integer :basic
      t.integer :da
      t.integer :hra
      t.integer :convenyance
      t.integer :meal_allowance
      t.integer :special_allowance

      t.timestamps null: false
    end
  end
end
