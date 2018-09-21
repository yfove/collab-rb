class DropCategoryColumnInProjectsTable < ActiveRecord::Migration[5.2]
  def up
    remove_column :projects, :category
  end
  def down
    add_column :projects, :category, :string
  end
end
