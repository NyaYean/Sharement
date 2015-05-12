Rails.application.routes.draw do

  root to: 'application#index'

  resources :users do
  	member do
  		post 'create_agreement', as: :create_agreement
  		delete 'remove_agreement', as: :remove_agreement
  		put 'edit_agreement', as: :edit_agreement
      post 'new_agreement', as: :new_agreement
      get 'agreements', as: :all_agreements
  	end
  end
  resources :agreements, only: [:index, :new, :create, :edit, :destroy]

  # resources :payments
  
  #log in form
  get 'sessions/new' => 'sessions#new'
  # request to log in the user
  post 'sessions' => 'sessions#create'
  # logging out the user
  delete 'sessions' => 'sessions#delete'

  post 'users/:id/new_agreement' => 'users#add_agreement'
  delete 'users/:id/remove_agreement' => 'users#remove_agreement'
  put 'users/:id/edit_agreement' => 'users#edit_agreement'
  get 'users/:id/agreements' => 'users#agreements'
  post 'users/:id/create_agreement' => 'users#create_agreement'

end
