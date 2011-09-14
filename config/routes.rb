SenchaOnRails::Application.routes.draw do

  get "welcome/index"

  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'user/current' => 'users#current', :as => :current_user
  get 'signup' => 'users#new', :as => :signup
  get 'logout' => 'sessions#destroy', :as => :logout
  get 'login' => 'sessions#new', :as => :login

  resources :sessions
  resources :users

  get 'touch' => 'touch#index', :as => :touch

  root :to => 'welcome#index'

end
