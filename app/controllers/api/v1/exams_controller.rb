module Api
  module V1
    class ExamsController < ApplicationController
      before_action :set_exam, only: [:show, :update, :destroy]

      def index
        render json: Exam.all
      end

      def show
        if @exam
          render json: @exam
        else
          render json: { error: 'Exam not found' }, status: 404
        end
      end

      def create
        exam = Exam.new(exam_params)
        if exam.save
          render json: exam, status: :created
        else
          render json: { errors: exam.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        unless @exam
          return render json: { error: 'Exam not found' }, status: 404
        end
        if @exam.update(exam_params)
          render json: @exam
        else
          render json: { errors: @exam.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        unless @exam
          return render json: { error: 'Exam not found' }, status: 404
        end
        @exam.destroy
        head :no_content
      end

      private

      def set_exam
        @exam = Exam.find_by(id: params[:id])
      end

      def exam_params
        params.require(:exam).permit(:course_id, :date, :exam_type, :duration, :max_score)
      end
    end
  end
end
