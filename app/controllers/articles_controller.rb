# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    Article.create(validated_params)

    redirect_to articles_path
  end

  def new
    @article = Article.new
    @article.questions.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.update(validated_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    Article.destroy(params[:id])

    redirect_to articles_path
  end

  private

  def validated_params
    params.require(:article).permit(
      :name,
      questions: %i[
        text
        answer
      ]
    )
  end
end
