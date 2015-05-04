Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create, :update]
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end

  # You're basically toggling an attribute on something that exists, that's
  # certainly the business of an #update function
  post '/answers/:id/best', to: 'answers#mark_as_best'

  root to: 'questions#index'

  resource :session, only: [:new, :create, :destroy]
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

end

