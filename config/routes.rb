Rails.application.routes.draw do

	# Login
  resources :sessions
  # Logout
  get 'log_out', :to => 'sessions#destroy', :as => 'log_out'

  root 'sessions#new'
	
end
