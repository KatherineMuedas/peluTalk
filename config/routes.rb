Rails.application.routes.draw do
  resources :peluquerias, except: [:destroy] do
    resources :reviews, only: [:create, :update, :destroy]
  end
  patch  "/peluquerias/:id/create_photo", to: "peluquerias#create_photo", as: :create_peluqueria_photo

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
