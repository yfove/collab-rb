class CreateCategorizations < ActiveRecord::Migration[5.2]
  def up
    create_table :categorizations do |t|
      t.integer :project_id
      t.integer :category_id
      t.text :cat_array, array: true, default: []
      t.text :cat_type
      t.timestamps
    end
  end
  def down
    drop_table :categorizations
  end
end
