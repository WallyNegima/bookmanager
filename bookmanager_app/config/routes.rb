Rails.application.routes.draw do
  root 'books#index'
  devise_for :users, :path => '/'
  resources :books , path_names: {
    new: 'register'
  }
  resources :ledgers
  resources :users, :only => [:index, :show]
end
