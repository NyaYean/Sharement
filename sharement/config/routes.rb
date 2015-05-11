Rails.application.routes.draw do

  root to: 'application#index'

  resources :users do
  	member do
  		put 'add_agreement', as: :add_agreement
  		put 'remove_agreement', as: :remove_agreement
  		put 'edit_agreement', as: :edit_agreement
  	end
  end
  # resources :agreements, only: [:index, :new, :create, :edit, :destroy]

  # resources :payments
  
  #log in form
  get 'sessions/new' => 'sessions#new'
  # request to log in the user
  post 'sessions' => 'sessions#create'
  # logging out the user
  delete 'sessions' => 'sessions#delete'
end
