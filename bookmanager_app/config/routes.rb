Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :path => '/'
  resources :books
  resources :ledgers
  resources :users, :only => [:index, :show]
end
