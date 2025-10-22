ActiveRecord::Schema.define(version: 2025_10_22_000000) do

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "student_number", null: false
    t.string "email", null: false
    t.date "birth_date"
    t.string "grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_index "students", ["student_number"], name: "index_students_on_student_number", unique: true
  add_index "students", ["email"], name: "index_students_on_email", unique: true

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.string "specialization"
    t.string "email", null: false
    t.string "phone"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true

  create_table "courses", force: :cascade do |t|
    t.string "course_name", null: false
    t.string "course_code", null: false
    t.integer "credits"
    t.string "semester"
    t.integer "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_index "courses", ["course_code"], name: "index_courses_on_course_code", unique: true

  create_table "exams", force: :cascade do |t|
    t.integer "course_id", null: false
    t.datetime "date", null: false
    t.string "exam_type"
    t.integer "duration"
    t.integer "max_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "exam_id", null: false
    t.integer "score", null: false
    t.text "comment"
    t.date "evaluation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "courses", "teachers"
  add_foreign_key "exams", "courses"
  add_foreign_key "grades", "students"
  add_foreign_key "grades", "exams"

end
