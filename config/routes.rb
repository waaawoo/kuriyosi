Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :items
  get "items_list" => "items#items_list"
end
