Rails.application.routes.draw do

  resources :comments
  resources :questions
  resource :session, only: [:new, :create, :destroy]
end
