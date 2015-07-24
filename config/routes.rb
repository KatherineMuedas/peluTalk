Rails.application.routes.draw do
  resources :peluquerias, except: [:destroy] do
    resources :reviews, only: [:create, :update, :destroy]
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
