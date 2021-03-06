Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#index"

  get '/session-viewer' => "sessions#view_session"
  get '/sessions/select/:id' => "sessions#add_sessions"

  get '/ideas' => "ideas#index"
  get '/ideas/new' => "ideas#new"
  post '/ideas' => "ideas#create"
  resources :sessions, only: [:new, :create, :destroy]
  resources :teachers, only: [:show]
  resources :cohorts, only: [:new, :create, :show, :update] do
    resources :students, only: [:new, :create]
    resources :groups, only: [:index, :create, :update]
  end
  resources :rounds, only: [:create, :update]
  resources :votes, only: [:create]
  resources :phases, only: [:update]
  resources :choices, only: [:create]
end
