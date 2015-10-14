Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'

  # AJAX
  get 'busca_cep', :to => 'ajax#busca_cep', :as => 'busca_cep'
  
  resources :admin_users
  post 'create_admin_user', :to => 'admin_users#create', :as => 'create_admin_user'
  get 'users/:id/:step_number', :to => 'users#edit', :as => 'user_step'

  # Login
  resources :sessions
  # Logout
  get 'log_out', :to => 'sessions#destroy', :as => 'log_out'

  resources :users
  get 'activate_account/:activation_token', :to => 'users#activate_account', :as => 'activate_account'

  # View
  get 'recovery_pass', :to => 'users#recovery_pass', :as => 'recovery_pass'
  get 'edit_pass', :to => 'users#edit_pass', :as => 'edit_pass'

  post 'recovery_pass', :to => 'users#create_recovery_pass', :as => 'create_recovery_pass'
  get 'edit_pass/:recovery_token', :to => 'users#edit_pass', :as => 'edit_pass_token'
  patch 'update_pass/:id', :to => 'users#update_pass', :as => 'update_pass'
	
end
