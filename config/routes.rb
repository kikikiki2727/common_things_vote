Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :jokes, only: %i[index create destroy]
  end
  
  get '*path', to: 'home#index'
end
