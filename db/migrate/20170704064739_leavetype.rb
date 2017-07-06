class Leavetype < ActiveRecord::Migration
  def change
rename_column :leaves, :type, :leave_type

  end
end
