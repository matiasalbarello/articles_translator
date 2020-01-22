# frozen_string_literal: true

feature 'user manages a question' do
  scenario 'a question is created' do
    article = Article.create(name: 'test')
    visit edit_article_path(article)

    click_on 'Create Question'
    fill_in('Text', with: 'This is a question')
    fill_in('Answer', with: 'This is an answer')

    expect { click_on('Save Question') }.to change { Question.count }.by 1
  end

  scenario 'deletes a question' do
    article = Article.create(name: 'test')
    question = Question.create(article: article, text: 'test')
    visit edit_article_path(article)

    expect { find("a[href='/articles/#{article.id}/questions/#{question.id}'][data-method='delete']").click }.to change { Question.count }.by(-1)
  end

  scenario 'edit a question' do
    article = Article.create(name: 'test')
    question = Question.create(article: article, text: 'text?', answer: 'answer')
    visit edit_article_path(article)

    find("a[href='/articles/#{article.id}/questions/#{question.id}/edit']").click
    fill_in('Text', with: 'text changed?')
    fill_in('Answer', with: 'answer changed')
    click_on('Save Question')

    expect(question.reload.text).to eq('text changed?')
    expect(question.answer).to eq('answer changed')
  end

  scenario 'editing a question enqueues the Translation Job' do
    article = Article.create(name: 'test')
    question = Question.create(article: article, text: 'text?', answer: 'answer')
    visit edit_article_path(article)

    find("a[href='/articles/#{article.id}/questions/#{question.id}/edit']").click
    fill_in('Text', with: 'text changed?')
    fill_in('Answer', with: 'answer changed')

    expect do
      click_on('Save Question')
    end.to have_enqueued_job(TranslateQuestionJob)
  end

  scenario 'creating a question enqueues the Translation Job' do
    article = Article.create(name: 'test')
    visit edit_article_path(article)

    click_on 'Create Question'
    fill_in('Text', with: 'This is a question')
    fill_in('Answer', with: 'This is an answer')

    expect do
      click_on('Save Question')
    end.to have_enqueued_job(TranslateQuestionJob)
  end
end
