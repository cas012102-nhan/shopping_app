Rails.application.routes.draw do
 
  resources :categories
  devise_for :users
  # get 'main/index'
  resources :main
  resources :products
 
  root to: 'products#index'
 

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
