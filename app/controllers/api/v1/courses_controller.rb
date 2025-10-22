module Api
  module V1
    class CoursesController < ApplicationController
      before_action :set_course, only: [:show, :update, :destroy]

      def index
        render json: Course.all
      end

      def show
        if @course
          render json: @course
        else
          render json: { error: 'Course not found' }, status: 404
        end
      end

      def create
        course = Course.new(course_params)
        if course.save
          render json: course, status: :created
        else
          render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        unless @course
          return render json: { error: 'Course not found' }, status: 404
        end
        if @course.update(course_params)
          render json: @course
        else
          render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        unless @course
          return render json: { error: 'Course not found' }, status: 404
        end
        @course.destroy
        head :no_content
      end

      private

      def set_course
        @course = Course.find_by(id: params[:id])
      end

      def course_params
        params.require(:course).permit(:course_name, :course_code, :credits, :semester, :teacher_id)
      end
    end
  end
end
