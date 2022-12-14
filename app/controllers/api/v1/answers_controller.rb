module Api
  module V1
    class AnswersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_answer, only: [:show, :update, :destroy]

      # GET /answers
      def index
        @answers = Answer.all.page params[:page]

        render json: {
          current_page: @answers.current_page,
          per_page: @answers.current_per_page,
          total_pages: @answers.total_pages,
          answers: @answers,
          message: 'OK'
        }

      end

      # GET /answers/1
      def show
        render json: @answer
      end

      # POST /answers
      def create
        @answer = Answer.new(answer_params)

        if @answer.save
          render json: @answer, status: :created
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /answers/1
      def update
        if @answer.update(answer_params)
          render json: @answer
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end

      # DELETE /answers/1
      def destroy
        @answer.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_answer
        @answer = Answer.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def answer_params
        params.require(:answer).permit(:body)
      end
    end
  end
end