class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :student_number, null: false
      t.string :email, null: false
      t.date :birth_date
      t.string :grade

      t.timestamps
    end

    add_index :students, :student_number, unique: true
    add_index :students, :email, unique: true
  end
end
