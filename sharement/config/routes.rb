Rails.application.routes.draw do

  root to: 'application#index'

  resources :users, only: [:index, :new, :create, :edit, :destroy]

  resources :agreements, only: [:index, :new, :create, :edit, :destroy]

  #log in form
  get 'sessions/new' => 'sessions#new'
  # request to log in the user
  post 'sessions' => 'sessions#create'
  # logging out the user
  delete 'sessions' => 'sessions#delete'
end
