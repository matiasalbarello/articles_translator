# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    resources :questions, except: %i[index] do
      resource :question_translation, only: %i[show]
    end
  end
end
