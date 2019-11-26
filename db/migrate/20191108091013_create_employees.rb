class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :employeeid
      t.integer :mobileno
      t.string :gender
      t.string :address

      t.timestamps null: false
    end
  end
end
