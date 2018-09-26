class AddingLookingForColumnToProjects < ActiveRecord::Migration[5.2]
  def up
    add_column :projects, :looking_for, :text, array: true, default: []
    add_column :members, :role, :string
  end
  def down
    remove_column :projects, :looking_for
    remove_column :members, :role
  end
end
