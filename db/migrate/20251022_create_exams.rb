class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.references :course, null: false, foreign_key: true
      t.datetime :date, null: false
      t.string :exam_type
      t.integer :duration
      t.integer :max_score

      t.timestamps
    end
  end
end
