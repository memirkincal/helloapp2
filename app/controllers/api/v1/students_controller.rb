module Api
  module V1
    class StudentsController < ApplicationController
      before_action :set_student, only: [:show, :update, :destroy, :grade_report]

      def index
        render json: Student.all
      end

      def show
        if @student
          render json: @student
        else
          render json: { error: 'Student not found' }, status: 404
        end
      end

      def create
        student = Student.new(student_params)
        if student.save
          render json: student, status: :created
        else
          render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        unless @student
          return render json: { error: 'Student not found' }, status: 404
        end
        if @student.update(student_params)
          render json: @student
        else
          render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        unless @student
          return render json: { error: 'Student not found' }, status: 404
        end
        @student.destroy
        head :no_content
      end

      def grade_report
        return render json: { error: 'Student not found' }, status: 404 unless @student
        grades = @student.grades.includes(exam: :course)
        report = {
          student_id: @student.id,
          student_name: @student.name,
          grades: grades.map { |g| { course: g.exam.course.course_name, exam_type: g.exam.exam_type, score: g.score } },
          average: (grades.map(&:score).sum.to_f / [grades.size, 1].max)
        }
        render json: report
      end

      private

      def set_student
        return unless defined?(Student)
        @student = Student.find_by(id: params[:id])
      end

      def student_params
        params.require(:student).permit(:name, :student_number, :email, :birth_date, :grade)
      end
    end
  end
end
