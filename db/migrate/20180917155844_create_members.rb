class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.boolean :approved, default: false
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
