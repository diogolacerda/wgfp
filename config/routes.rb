Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  
  # Login
  resources :sessions
  # Logout
  get 'log_out', :to => 'sessions#destroy', :as => 'log_out'

  resources :users
  get 'activate_account/:activation_token', :to => 'users#activate_account', :as => 'activate_account'

  # View
  get 'recovery_pass', :to => 'users#recovery_pass', :as => 'recovery_pass'
  
  post 'recovery_pass', :to => 'users#create_recovery_pass', :as => 'create_recovery_pass'
  get 'edit_pass/:recover_token', :to => 'users#edit_pass', :as => 'edit_pass_token'
	
end
