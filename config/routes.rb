Rails.application.routes.draw do
  # get 'password_resets/new'
  # get 'password_resets/edit'
  #get 'sessions/new'
  #get 'users/new'
  resources :learns
  # get 'welcome/index'
  # root 'welcome#index'
  
  get 'start/index'
  root 'start#index'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
