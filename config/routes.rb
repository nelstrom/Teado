SenchaOnRails::Application.routes.draw do
  resources :users

  get "welcome/index"
  root :to => 'welcome#index'
end
