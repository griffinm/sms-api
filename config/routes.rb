Rails.application.routes.draw do

  resources :health, only: [:index]

end
