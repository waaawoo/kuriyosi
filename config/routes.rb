Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :tops, only: [:show]
  resources :items
  resources :news
  resources :stores
  resources :sales do
    collection do
      get 'search'
    end
  end
  get "items_list" => "items#items_list"
  get "campaign_list" => 'tops#campaign_list'
end
