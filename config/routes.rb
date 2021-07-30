Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  resources :home

  devise_for :users
  
  resources :sports

  resources :employees
  
  resources :companies

  resources :students
  resources :teachers

  resources :subscriptions do
    get :subscribe, on: :collection
    get :pay_now, on: :collection
  end
  resources :subscription_plans
  resources :userrs

  resources :categories
  resources :products

  resources :articles do
    resources :comments
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :products
    end
  end
end
