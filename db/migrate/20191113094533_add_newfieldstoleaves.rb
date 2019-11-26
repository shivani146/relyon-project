class AddNewfieldstoleaves < ActiveRecord::Migration
  def change
    add_column :leaves, :total_lop, :integer
  end
end
