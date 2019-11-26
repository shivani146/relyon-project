class CreateSalary < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      enable_extension "hstore"
      t.hstore :salary_hash
      t.hstore :total_earning_hash
      t.hstore :total_deduction_hash
      t.float :net_salary
      # add_column :salary, :salary_hash, :hstore
      # add_column :salary, :total_earning_hash, :hstore
      # add_column :salary, :total_deduction_hash, :hstore
      # add_column :salary, :net_salary, :float
    end
    add_reference :salaries, :employee, index: true, foreign_key: true
  end
end
