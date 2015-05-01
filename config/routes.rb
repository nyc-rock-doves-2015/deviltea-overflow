Rails.application.routes.draw do

  root to: 'questions#index'

  resources :comments
  resources :questions
  resource :session, only: [:new, :create, :destroy]

  get '/logout', to: 'sessions#destroy'


end
