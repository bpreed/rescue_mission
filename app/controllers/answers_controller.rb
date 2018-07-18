class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer saved successfully."
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save answer"
      if @question.answers.length > 0
        @answers = @question.answers
      end
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end
