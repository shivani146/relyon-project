class AddRoleInEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :role, :string, default: 'user'
  end
end
