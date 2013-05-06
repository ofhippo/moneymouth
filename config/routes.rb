Moneymouth::Application.routes.draw do
  root :to => 'user_sessions#new'

  resources :user_sessions, :users

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'signup' => 'users#new', :as => :signup
end
