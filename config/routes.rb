Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  root to: "tasks#index"
  resources :tasks do
    collection do
      get 'export'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  match '/login', to: 'sessions#create', via: [:post, :patch, :put]
end
