class AddDefaultValueIn < ActiveRecord::Migration
  def change
    change_column_default :salary_heads, :earnings, false
    change_column_default :salary_heads, :deduction, false

  end
end
