Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create]
  end

  resources :comments
end
