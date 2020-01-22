# frozen_string_literal: true

class QuestionTranslationsController < ApplicationController
  def show
    @question = QuestionTranslation.find_by(question_id: params[:question_id])

    render 'questions/show'
  end
end
