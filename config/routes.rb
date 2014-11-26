Rails.application.routes.draw do

  devise_for :users

  root :to => 'admin_home#index'

  resources :health, only: [:index]

  resources :sms, only: [:create, :index]

  # Admin Actions:
  resources :authorized_numbers
  
end
