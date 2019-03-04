Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
