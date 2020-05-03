Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  namespace :categories do
    resources :searches, only: :index
  end
  resources :categories, except: :index do
    resources :menus
  end
  resources :users, only: :show
end