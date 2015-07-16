Rails.application.routes.draw do
  resources :peluquerias, except: [:destroy]

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
