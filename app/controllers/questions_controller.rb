# frozen_string_literal: true

class QuestionsController < ApplicationController
  def create
    question = Question.create(validated_params)
    question.enqueue_translation

    redirect_to article_path(question.article)
  end

  def new
    @article = Article.find(params[:article_id])
    @question = Question.new(article: @article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @question = Question.find(params[:id])
  end

  def update
    article = Article.find(params[:article_id])
    question = Question.find(params[:id])
    if question.update(validated_params)
      question.enqueue_translation
      redirect_to article_path(article)
    else
      render :edit
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    Question.destroy(params[:id])

    redirect_to article_path(Article.find(params[:article_id]))
  end

  private

  def validated_params
    params.require(:question).permit(
      :text,
      :answer
    ).merge(article_id: params[:article_id])
  end
end
