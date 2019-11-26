class ChangePhoneToBeStringInEmployees < ActiveRecord::Migration
  def change
    change_column :employees, :mobileno, :string
  end
end
