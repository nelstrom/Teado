SenchaOnRails::Application.routes.draw do
  resources :users

  get "touch/index"
  root :to => 'touch#index'
end
