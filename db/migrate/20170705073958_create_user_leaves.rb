class CreateUserLeaves < ActiveRecord::Migration
  def change
    create_table :user_leaves do |t|
      t.integer :user_id
      t.string :leave_type
      t.integer :leave_taken
      t.integer :leave_left

      t.timestamps null: false
    end
  end
end
