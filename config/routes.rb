Rails.application.routes.draw do
  get 'gossips/new'

  get 'gossips/show'

  get 'home/index'
  root "gossips#index"

  resources :gossips
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
