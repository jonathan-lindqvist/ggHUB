Rails.application.routes.draw do
  get 'users/new'
  resources :learns
  # get 'welcome/index'
  # root 'welcome#index'
  
  get 'start/index'
  root 'start#index'

  get  '/signup',  to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
