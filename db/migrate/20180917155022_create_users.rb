class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text  :bio
      t.integer :age
      t.integer :year
      t.string :institution
      t.string :job_field
      t.text :interests, array: true, default: []


      t.timestamps
    end
  end
end
