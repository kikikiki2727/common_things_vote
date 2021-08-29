Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :jokes, only: %i[index create destroy]
    resources :sessions, only: %i[create destroy]
    resources :users, only: %i[create]
  end
  
  get '*path', to: 'home#index'
end
