module Api
  module V1
    class QuestionsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_question, only: [:show, :update, :destroy]

      # GET /questions
      def index
        @questions = Question.order(:title).page params[:page]

        render json: {
          current_page: @questions.current_page,
          per_page: @questions.current_per_page,
          total_pages: @questions.total_pages,
          questions: @questions,
          message: 'OK'
        }
      end

      # GET /questions/1
      def show
        render json: @question
      end

      # POST /questions
      def create
        @question = Question.new(question_params)

        if @question.save
          render json: @question, status: :created
        else
          render json: @question.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /questions/1
      def update
        if @question.update(question_params)
          render json: @question
        else
          render json: @question.errors, status: :unprocessable_entity
        end
      end

      # DELETE /questions/1
      def destroy
        @question.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_question
        @question = Question.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def question_params
        params.require(:question).permit(:title, :body)
      end
    end
  end
end
