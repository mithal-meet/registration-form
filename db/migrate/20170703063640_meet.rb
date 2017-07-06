class Meet < ActiveRecord::Migration
  def change
change_column_default(:users, :banned, true)

  end
end
