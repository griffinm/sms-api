Rails.application.routes.draw do

  resources :health, only: [:index]

  resources :sms, only: [:create]

end
