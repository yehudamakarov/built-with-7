Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # login_stuff
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  match '/logout' => 'sessions#destroy', via: [:get, :post]

  resources :users

  # home stuff
  root 'application#welcome'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'


end
