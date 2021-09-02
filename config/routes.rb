Rails.application.routes.draw do

  resources :registrations, only: [:create]
  resources :sessions, only: [:index, :create]
  resource :sessions, only: [:destroy]

  resources :products, only: [:index, :show] do
    resources :deals, only: [:create, :update, :destroy]
  end

  resources :deals, only: [:index]
end
