Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :tops, only: [:show]
  resources :items
  resources :news
  resources :stores
  resources :sales
  get "items_list" => "items#items_list"
  get "campaign_list" => 'tops#campaign_list'
  get "sales_list" => 'sales#sales_list'
end
