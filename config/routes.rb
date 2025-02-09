Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :products
  resources :sales
  resources :rates
end
