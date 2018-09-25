class AddingLookingForColumnToProjects < ActiveRecord::Migration[5.2]
  def up
    add_column :projects, :looking_for, :text, array: true, default: []
  end
  def down
    remove_column :projects, :looking_for
  end
end
