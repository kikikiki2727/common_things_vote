Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :jokes, only: [:index, :create, :destroy], shallow: true do
      resources :votes, only: [:create]
    end
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:index, :create] do
      collection do
        get 'me'
      end
    end
    get '/votes', to: 'votes#index'
  end

  get '*path', to: 'home#index'
end
