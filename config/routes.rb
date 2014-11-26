Rails.application.routes.draw do

  devise_for :users
  resources :health, only: [:index]

  resources :sms, only: [:create, :index]

end
