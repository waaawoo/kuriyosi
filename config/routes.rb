Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :tops, only: [:show]
  resources :items
  resources :news
  resources :store
  get "items_list" => "items#items_list"
end
