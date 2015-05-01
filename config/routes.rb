Rails.application.routes.draw do
  resources :questions do
    resources :answer, only: [:create]
  end
end
