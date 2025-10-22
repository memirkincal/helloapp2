module Api
  module V1
    class GradesController < ApplicationController
      before_action :set_grade, only: [:show, :update, :destroy]

      def index
        render json: Grade.all
      end

      def show
        if @grade
          render json: @grade
        else
          render json: { error: 'Grade not found' }, status: 404
        end
      end

      def create
        grade = Grade.new(grade_params)
        if grade.save
          render json: grade, status: :created
        else
          render json: { errors: grade.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        unless @grade
          return render json: { error: 'Grade not found' }, status: 404
        end
        if @grade.update(grade_params)
          render json: @grade
        else
          render json: { errors: @grade.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        unless @grade
          return render json: { error: 'Grade not found' }, status: 404
        end
        @grade.destroy
        head :no_content
      end

      private

      def set_grade
        @grade = Grade.find_by(id: params[:id])
      end

      def grade_params
        params.require(:grade).permit(:student_id, :exam_id, :score, :comment, :evaluation_date)
      end
    end
  end
end
