class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :course_name, null: false
      t.string :course_code, null: false
      t.integer :credits
      t.string :semester
      t.references :teacher, foreign_key: true

      t.timestamps
    end

    add_index :courses, :course_code, unique: true
  end
end
