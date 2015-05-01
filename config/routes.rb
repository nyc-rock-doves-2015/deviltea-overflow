Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create]
  end

  root to: 'questions#index'

  resources :comments
  root "questions#index"
  resource :session, only: [:new, :create, :destroy]
  get '/logout', to: 'sessions#destroy'
end

