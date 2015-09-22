Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  
  # Login
  resources :sessions
  # Logout
  get 'log_out', :to => 'sessions#destroy', :as => 'log_out'

  resources :users
  get 'activate_account/:activation_token', :to => 'users#activate_account', :as => 'activate_account'

	
end
