module Api
  module V1
    class TeachersController < ApplicationController
      before_action :set_teacher, only: [:show, :update, :destroy]

      def index
        render json: Teacher.all
      end

      def show
        if @teacher
          render json: @teacher
        else
          render json: { error: 'Teacher not found' }, status: 404
        end
      end

      def create
        teacher = Teacher.new(teacher_params)
        if teacher.save
          render json: teacher, status: :created
        else
          render json: { errors: teacher.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        unless @teacher
          return render json: { error: 'Teacher not found' }, status: 404
        end
        if @teacher.update(teacher_params)
          render json: @teacher
        else
          render json: { errors: @teacher.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        unless @teacher
          return render json: { error: 'Teacher not found' }, status: 404
        end
        @teacher.destroy
        head :no_content
      end

      private

      def set_teacher
        @teacher = Teacher.find_by(id: params[:id])
      end

      def teacher_params
        params.require(:teacher).permit(:name, :specialization, :email, :phone, :start_date)
      end
    end
  end
end
