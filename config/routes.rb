Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :jokes, only: %i[index create destroy], shallow: true do
      resources :votes, only: %i[create]
    end
    resources :sessions, only: %i[create destroy]
    resources :users, only: %i[create] do
      collection do
        get 'me'
      end
    end
    get '/votes', to: 'votes#index'
  end
  
  get '*path', to: 'home#index'
end
