class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :specialization
      t.string :email, null: false
      t.string :phone
      t.date :start_date

      t.timestamps
    end

    add_index :teachers, :email, unique: true
  end
end
