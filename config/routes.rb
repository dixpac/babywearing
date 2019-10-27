Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :signed_agreements, only: [:show, :create]
  resources :fee_types
  resources :agreements
  resources :locations
  resources :membership_types
  resources :users, only: [:index]
  resources :carriers do
    resource :loans, only: [:new, :create], module: :carriers
  end

  resources :photos, only: :destroy
  get 'home/index'

  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'carriers#index'
end
