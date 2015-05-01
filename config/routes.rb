Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create]

  resources :comments

  root "questions#index"
end

