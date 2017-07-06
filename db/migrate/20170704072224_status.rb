class Status < ActiveRecord::Migration
  def change
  	add_column :leaves, :status, :boolean, :default => false

  end
end
