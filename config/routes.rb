SenchaOnRails::Application.routes.draw do

  resources :tasks

  get "welcome/index"

  get 'signup' => 'users#new', :as => :signup
  get 'logout' => 'sessions#destroy', :as => :logout
  get 'login' => 'sessions#new', :as => :login

  get 'users/edit' => 'users#edit', :as => :edit_current_user
  get 'users/current' => 'users#current', :as => :current_user
  resources :users
  resources :sessions

  get 'touch' => 'touch#index', :as => :touch

  root :to => 'welcome#index'

end
