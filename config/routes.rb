Rails.application.routes.draw do
  root 'events#index'
  resources :users
  resources :events, only: %i[show new create index]
  resources :sessions
  resources :registrations, only: [:create, :destroy, :update]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  post '/registrations', to: 'registrations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
