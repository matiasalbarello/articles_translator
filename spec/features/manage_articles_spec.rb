# frozen_string_literal: true

feature 'user manages an article' do
  scenario 'an article is created' do
    visit root_path
    click_on 'Create Article'
    fill_in('Name', with: 'test')

    expect { click_on('Create Article') }.to change { Article.count }.by 1
  end

  scenario 'deletes an article' do
    article = Article.create(name: 'test')
    visit root_path

    expect { find("a[href='/articles/#{article.id}'][data-method='delete']").click }.to change { Article.count }.by(-1)
  end

  scenario 'edit an article' do
    article = Article.create(name: 'test')
    visit root_path
    find("a[href='/articles/#{article.id}/edit']").click
    fill_in('Name', with: 'changed')
    click_on('Update Article')

    expect(article.reload.name).to eq('changed')
  end
end
