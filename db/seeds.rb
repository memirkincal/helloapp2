# Example seed data for the assignment

teacher = Teacher.create!(name: "Dr. Ada Lovelace", specialization: "Computer Science", email: "ada@example.com")

course = Course.create!(course_name: "Intro to Algorithms", course_code: "CS101", credits: 4, semester: "Fall", teacher: teacher)

student = Student.create!(name: "Ali Veli", student_number: "S12345", email: "ali@example.com", birth_date: "2000-01-01", grade: "A")

exam = Exam.create!(course: course, date: Time.now + 7.days, exam_type: "Midterm", duration: 90, max_score: 100)

Grade.create!(student: student, exam: exam, score: 88, comment: "Good work", evaluation_date: Date.today)

puts "Seeded teacher, course, student, exam, and grade."
