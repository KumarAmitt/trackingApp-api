Rails.application.routes.draw do
  root to: 'static#home'

  resources :sessions, only: [:create]
end
