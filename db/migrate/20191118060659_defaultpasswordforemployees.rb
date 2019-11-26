class Defaultpasswordforemployees < ActiveRecord::Migration
  def change
    change_column_default :employees, :encrypted_password, "relyon"
  end
end
