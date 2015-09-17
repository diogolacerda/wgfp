Rails.application.routes.draw do

  get 'users/index'

  get 'users/new'

  get 'users/edit'

  get 'home/index'

	# Login
  resources :sessions
  # Logout
  get 'log_out', :to => 'sessions#destroy', :as => 'log_out'

  root 'home#index'
	
end
