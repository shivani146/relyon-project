class AddsalaryheadhashOnSalaryallotment < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    add_column :salary_allotments, :salary_head_hash, :hstore
  end
end
