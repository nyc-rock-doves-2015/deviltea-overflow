Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create]
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end

  post '/answers/:id/best', to: 'answers#mark_as_best'

  root to: 'questions#index'

  resource :session, only: [:new, :create, :destroy]
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

end

