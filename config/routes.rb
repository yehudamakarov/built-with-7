Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # login_stuff
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  match '/logout' => 'sessions#destroy', via: [:get, :post]

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # home stuff
  root 'application#welcome'

  # model stuff
  resources :users do
    resources :days, only: [:show, :new]
  end
  resources :accomplishments

  # days routes
  resources :days, only: [:index, :show]
  get '/today' => 'days#today'

  get '/weekdays/:day' => 'accomplishments#day_of_week_index', as: 'day_of_week'
  get '/weekdays/:day/accomplishments/new' => 'accomplishments#new', as: 'new_weekday_accomplishment'

  get '/users/with-most-unique-accomplishments/:amount' => 'users#with_most_unique_accomplishments', as: 'most_accomplishments'

  get '/users/with-bussiest-week/:amount' => 'users#with_bussiest_week', as: 'bussiest_week'



end
