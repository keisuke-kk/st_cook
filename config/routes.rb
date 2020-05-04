Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  namespace :categories do
    resources :searches, only: :index
  end
  resources :categories, except: :index do
    namespace :menus do
      resources :searches, only: :index
    end
    resources :menus 
    collection do
      get 'random'
    end
  end
  resources :users, only: :show
end